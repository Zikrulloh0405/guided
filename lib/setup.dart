
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:guidist/firebase_options.dart";

import "src/common/local/app_storage.dart";


Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  // FlutterError.onError = (FlutterErrorDetails errorDetails) {
  //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  // };
  // PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };
  await getStorageValues();
}

String? token;

Future<void> getStorageValues() async {


  // final UserModel? _userModel = await AppRepositoryImpl().getCurrentUser();
  //
  // if(_userModel != null){
  //   if()
  // }


  token = await AppStorage.$read(key: StorageKey.accessToken);
  // l.w(token ?? "------\n------------\n-----------\n-------" " ====================================");
}


