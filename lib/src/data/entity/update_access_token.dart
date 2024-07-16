import "dart:convert";

UpdateAccessToken updateAccessTokenFromJson(String str) => UpdateAccessToken.fromJson(json.decode(str));

String updateAccessTokenToJson(UpdateAccessToken data) => json.encode(data.toJson());

class UpdateAccessToken {

  UpdateAccessToken({
    this.success,
    this.data,
  });

  factory UpdateAccessToken.fromJson(Map<String, dynamic> json) => UpdateAccessToken(
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );
  final bool? success;
  final Data? data;

  UpdateAccessToken copyWith({
    bool? success,
    Data? data,
  }) =>
      UpdateAccessToken(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
  };
}

class Data {

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
  );

  Data({
    this.accessToken,
    this.refreshToken,
  });
  final String? accessToken;
  final String? refreshToken;

  Data copyWith({
    String? accessToken,
    String? refreshToken,
  }) =>
      Data(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
      );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };
}
