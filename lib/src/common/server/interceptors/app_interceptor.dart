import "dart:convert";
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../data/entity/update_access_token.dart';
import '../../local/app_storage.dart';
import "../../routes/app_route_name.dart";
import "../../routes/app_router.dart";
import '../api/api_constants.dart';

class AppInterceptor extends Interceptor {
  AppInterceptor._();

  static final AppInterceptor instance = AppInterceptor._();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll(await getHeaders());
    if (kDebugMode) {
      log(
        "---------[Interceptor]---------ON_REQUEST(${options.method})------------------\n\n"
        "URL: ${options.uri}\n"
        "Data: ${options.data}\n"
        "Headers: ${options.headers}\n"
        "---------------------------------------------------------------------------\n\n",
      );
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      log(
        "---------[Interceptor]---------ON_RESPONSE(${response.statusCode})------------------\n\n"
        "URL: ${response.realUri}\n"
        "Data: ${response.data}\n"
        "---------------------------------------------------------------------------\n\n",
      );
    }
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      log(
        "---------[Interceptor]---------ON_ERROR(${err.response?.statusCode})------------------\n\n"
        "URL: ${err.response?.realUri.path}\n"
        "TYPE: ${err.type}\n"
        "Data: ${err.response?.data}\n"
        "Message: ${err.message}\n"
        "---------------------------------------------------------------------------\n\n",
      );
    }

    if (err.response?.statusCode == 400 && err.response?.data["error"]["code"] == "TOKEN_EXPIRED") {
      final String? accessToken = await AppStorage.$read(key: StorageKey.accessToken);
      final String? refreshToken = await AppStorage.$read(key: StorageKey.refreshToken);

      // log("Access Token: $accessToken");
      // log("Refresh Token: $refreshToken");

      if (accessToken != null && refreshToken != null) {
        final RequestOptions requestOptions = err.response!.requestOptions;

        final Dio dio = Dio(
          BaseOptions(
            baseUrl: ApiConst.baseUrl,
            connectTimeout: ApiConst.connectionTimeout,
            receiveTimeout: ApiConst.receiveTimeout,
            contentType: Headers.jsonContentType,
          ),
        );

        final Response<dynamic>? response = Response(requestOptions: RequestOptions());//await refreshAccessToken(dio, refreshToken, accessToken);

        if (response == null || response.statusCode == 401) {
          await _logout();
          handler.next(err);
        } else {
          final String responseData = jsonEncode(response.data);
          final UpdateAccessToken updateAccessToken = updateAccessTokenFromJson(responseData);
          log("\n[New Access Token] : ${updateAccessToken.data!.accessToken}");
          log("\n[New Refresh Token] : ${updateAccessToken.data!.refreshToken}");

          await AppStorage.$write(key: StorageKey.accessToken, value: updateAccessToken.data!.accessToken!);
          await AppStorage.$write(key: StorageKey.refreshToken, value: updateAccessToken.data!.refreshToken!);

          final String newToken = await AppStorage.$read(key: StorageKey.accessToken) ?? "";
          requestOptions.headers["Authorization"] = "Bearer $newToken";
          final Response<dynamic> retryResponse = await dio.fetch(requestOptions);
          handler.resolve(retryResponse);
        }
      } else {
        await _logout();
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }

  Future<void> _logout() async {
    await AppStorage.$delete(key: StorageKey.user);
    await AppStorage.$delete(key: StorageKey.accessToken);
    await AppStorage.$delete(key: StorageKey.refreshToken);
    await AppStorage.$delete(key: StorageKey.pinCode);
    // AppRouter.router.go(AppRouteName.initialPage);
  }

  Future<Response<dynamic>?> refreshAccessToken(Dio dio, String refreshToken, String accessToken) async {
    try {
      final Response<dynamic> response = await dio.post(
        ApiConst.apiRefreshToken,
        data: <String, String>{"accessToken": accessToken, "refreshToken": refreshToken},
        options: Options(headers: <String, dynamic>{"Content-type": "application/json"}),
      );

      log("\n\nAccess Token is Updated\n\n");

      return response;
    } on Exception catch (error) {
      log("REFRESH ERROR: $error");
      return null;
    }
  }

  static Future<Map<String, String>> getHeaders({bool isUpload = false, String? token}) async {
    final Map<String, String> headers = <String, String>{
      "Content-type": isUpload ? "multipart/form-data" : "application/json",
    };

    token = await AppStorage.$read(key: StorageKey.accessToken) ?? "";
    if (token.isNotEmpty) {
      headers.putIfAbsent("Authorization", () => "Bearer $token");
    }

    return headers;
  }
}
