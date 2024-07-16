import 'package:flutter/material.dart';
import '../../common/styles/app_colors.dart';

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton({
    super.key,
    required this.height,
    required this.width,
    required this.onPressed,
    required this.child,
  });

  final double height;
  final double width;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration:  const BoxDecoration(
          gradient: LinearGradient(colors: AppColors.btnColorGradient)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: child,
        ),
      ),
    );
  }
}