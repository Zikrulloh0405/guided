import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guidist/src/common/styles/app_colors.dart';

import '../../../../../../../generated/assets.dart';
import '../../../../../../common/styles/text_style.dart';

class CustomSearchBarWidget extends StatelessWidget {
  const CustomSearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 63.h,
      child: TextField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColors.cE0E0E0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColors.cE0E0E0),
          ),
          fillColor: AppColors.white,
          filled: true,
          prefixIcon: SvgPicture.asset(
            Assets.iconsSearch,
          ),
          // prefixIconColor: Colors.black,
          prefixIconConstraints: BoxConstraints(
            minWidth: 50.w,
            minHeight: 20.h,
          ),
          hintText: "Search Destination",
          hintStyle: const AppTextStyle().titleSmall?.copyWith(
                color: const Color(
                  0xffB6B6B6,
                ),
              ),
        ),
      ),
    );
  }
}
