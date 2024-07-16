import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:guidist/src/common/routes/app_route_name.dart';

AutoDisposeChangeNotifierProvider<MainController> mainController = ChangeNotifierProvider.autoDispose<MainController>(
  (ChangeNotifierProviderRef<MainController> ref) => MainController(),
);

class MainController with ChangeNotifier {
  int currentIndex = 0;

  void changePage(int index, BuildContext context) {
    currentIndex = index;
    if (index == 0) {
      context.go(AppRouteName.touristHomePage);
    } else if (index == 1) {
      context.go(AppRouteName.schedulePage);
    } else if (index == 2) {
      context.go(AppRouteName.chatPage);
    } else if (index == 3) {
      context.go(AppRouteName.profilePage);
    } else {
      context.go(AppRouteName.touristHomePage);
    }
  }
}
