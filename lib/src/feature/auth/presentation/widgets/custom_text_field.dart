import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guidist/src/common/styles/text_style.dart';

import '../../../../common/styles/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.headerText,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.isPassword = false,
    this.changePasswordVisibility
  });

  final String headerText;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool isPassword;
  final VoidCallback? changePasswordVisibility;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerText,
          style: const AppTextStyle().bodyLarge,
        ),
        SizedBox(
          height: 5.h,
        ),
        TextFormField(
          controller: controller,
          cursorColor: AppColors.white,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: changePasswordVisibility,
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                  )
                : const SizedBox.shrink(),
            fillColor: AppColors.textFieldColorWhite,
            filled: true,
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(
                13.r,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.cE0E0E0,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(
                13.r,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                13.r,
              ),
              borderSide: const BorderSide(
                color: AppColors.cE0E0E0,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                13.r,
              ),
              borderSide: const BorderSide(
                color: AppColors.cE0E0E0,
                width: 1,
              ),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
