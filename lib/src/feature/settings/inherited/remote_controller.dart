// import "dart:convert";
// import "dart:developer";
//
// import "package:firebase_core/firebase_core.dart";
// import "package:firebase_remote_config/firebase_remote_config.dart";
// import "package:flutter/material.dart";
// // import "package:flutter_riverpod/flutter_riverpod.dart";
// //
// // import "../../../common/local/app_storage.dart";
// // import "../model/language_type.dart";
// // import "../../../../remote/core_meta_model.dart";
// // import "../../../../remote/global_variables.dart";
// import "core_meta_model.dart";
//
// // final AutoDisposeChangeNotifierProvider<RemoteConfigController> remoteConfigProvider = ChangeNotifierProvider.autoDispose<RemoteConfigController>((ChangeNotifierProviderRef<RemoteConfigController> ref) => RemoteConfigController());
//
// // ignore: prefer_mixin
// class RemoteConfigController with ChangeNotifier {
//   RemoteConfigController() : appConfig = AppConfig(appTheme: "", appLanguage: "", appBlocked: false, switchedInitialScreen: false){
//     fetchAndActivate();
//   }
//
//   late AppConfig appConfig;
//
//   static final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;
//
//   Future<void> fetchAndActivate() async {
//     await _remoteConfig.setDefaults(<String, dynamic>{
//       "core_meta": '''{
//         "appTheme": "dark",
//         "appLanguage": "uz",
//         "appBlocked": true,
//         "switchedInitialScreen": false
//       }'''
//     });
//
//     try {
//       await activate();
//       _remoteConfig.onConfigUpdated.listen((RemoteConfigUpdate event) async {
//         await activate();
//         notifyListeners();
//       });
//     } on FirebaseException catch (e) {
//       debugPrint("Error fetching remote config: ${e.message}");
//     } finally {
//       notifyListeners();
//     }
//   }
//
//   Future<void> activate() async {
//     await _remoteConfig.fetchAndActivate();
//     String coreMetaString = _remoteConfig.getString('core_meta');
//
//     try {
//       appConfig = AppConfig.fromJson(jsonDecode(coreMetaString) as Map<String, dynamic>);
//       log("App Blocked: ${appConfig.appBlocked.toString()}");
//       log("App Theme: ${appConfig.appTheme.toString()}");
//       log("App switch: ${appConfig.switchedInitialScreen.toString()}");
//       log("App language: ${appConfig.appLanguage.toString()}");
//       notifyListeners();
//     } catch (e) {
//       debugPrint("Error decoding core_meta JSON: $e");
//     }
//
//     notifyListeners();
//   }
// }
//
//   // Future<Map<String, dynamic>?> getResult(String key) async {
//   //   final RemoteConfigValue value = _remoteConfig.getValue(key);
//   //   if (value.asString().isEmpty) {
//   //     notifyListeners();
//   //     return null;
//   //   }
//   //
//   //   try {
//   //     await AppStorage.$write(key: StorageKey.coreMeta, value: value.asString());
//   //     notifyListeners();
//   //     return jsonDecode(value.asString()) as Map<String, dynamic>;
//   //   } on FormatException catch (e) {
//   //     debugPrint("Error decoding JSON from Remote Config: ${e.message}");
//   //     return null;
//   //   }
//   // }
//   //
//   // Future<void> performConfig() async {
//   //   late AppConfig appConfig;
//   //   final Map<String, dynamic>? map = await getResult("core_meta");
//   //   appConfig = AppConfig.fromJson(
//   //     map ??
//   //         <String, dynamic>{
//   //           "appTheme": "system",
//   //           "appLanguage": "en",
//   //           "appBlocked": false,
//   //           "switchedInitialScreen": false,
//   //         },
//   //   );
//   //
//   //   switch (appConfig.appTheme) {
//   //     case "system":
//   //       appTheme = ThemeMode.system;
//   //     case "light":
//   //       appTheme = ThemeMode.light;
//   //     case "dart":
//   //       appTheme = ThemeMode.dark;
//   //   }
//   //
//   //   switch (appConfig.appLanguage) {
//   //     case "en":
//   //       languageType = LanguageType.en;
//   //     case "uz":
//   //       languageType = LanguageType.uz;
//   //     case "ru":
//   //       languageType = LanguageType.ru;
//   //   }
//   //   appBlocked = appConfig.appBlocked;
//   //   switchedInitialScreen = appConfig.switchedInitialScreen;
//   //   notifyListeners();
//   // }
//   //
//   // Future<AppConfig> loadData()async{
//   //   final String value = await AppStorage.$read(key: StorageKey.coreMeta) ?? '''
//   //   {
//   //           "appTheme": "system",
//   //           "appLanguage": "en",
//   //           "appBlocked": false,
//   //           "switchedInitialScreen": false,
//   //         }
//   //   ''';
//   //   notifyListeners();
//   //   return AppConfig.fromJson(jsonDecode(value) as Map<String, dynamic>);
//   // }
//   //
//   // bool get blocked{
//   //   return appBlocked;
//   // }
//
//
// // }
