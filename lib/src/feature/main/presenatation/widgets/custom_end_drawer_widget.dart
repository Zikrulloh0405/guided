import 'package:flutter/material.dart';
import 'package:guidist/src/common/styles/app_colors.dart';

class CustomEndDrawerWidget extends StatelessWidget {
  const CustomEndDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: double.infinity,
      backgroundColor: AppColors.white,
    );
  }
}
