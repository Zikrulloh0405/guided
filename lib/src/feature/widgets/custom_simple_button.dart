import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/styles/app_colors.dart';

class CustomSimpleButton extends StatelessWidget {
  const CustomSimpleButton(
      {super.key, required this.height, required this.width, required this.onPressed, required this.child, required this.color, this.elevation});

  final double height;
  final double width;
  final VoidCallback onPressed;
  final Widget child;
  final Color color;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13.r),
      ),
      color: color,
      height: height,
      minWidth: width,
      onPressed: onPressed,
      elevation: elevation ?? 3,
      child: child,
    );
  }
}
