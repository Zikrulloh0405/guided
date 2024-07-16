import "dart:ui";

import "package:meta/meta.dart";

@immutable
final class AppColors {
  const AppColors._();

  // light
  static const Color white = Color(0xFFFFFFFF);
  static const Color backgroundColorWhite = Color(0xffD3DAED);
  static Color textFieldColorWhite = const Color(0xffF1F1F1).withOpacity(.5);
  static const Color btnColor = Color(0xff0F5DD3);
  static const Color bckgrColor = Color(0xffFAFAFA);
  static const Color cE0E0E0 = Color(0xffE0E0E0);
  static const Color c757575 = Color(0xff757575);

  // gradient
  static const List<Color> backgroundColorGradient = <Color>[
    Color(0xff0E214F),
    Color(0xff000000),
  ];

  static const List<Color> btnColorGradient = <Color>[
    Color(0xffAE00DA),
    Color(0xffEB0AB6),
  ];

  //dark
  static const Color black = Color(0xFF000000);
  static const Color backgroundColorDark = Color(0xff020C27);
}
