import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

ChangeNotifierProvider<InitController> initController = ChangeNotifierProvider<InitController>(
  (ChangeNotifierProviderRef<InitController> ref) => InitController(),
);

class InitController extends ChangeNotifier {
  InitController() {
    pageController = PageController();
    pageController.addListener(
      () {
        notifyListeners();
      },
    );
  }

  int currentPage = 0;
  late PageController pageController;

  void changePage(int index) {
    currentPage = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linearToEaseOut,
    );
    notifyListeners();
  }
}
