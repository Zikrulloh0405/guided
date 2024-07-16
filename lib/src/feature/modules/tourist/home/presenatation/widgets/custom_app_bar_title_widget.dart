import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/styles/text_style.dart';

class CustomAppBarTitleWidget extends StatelessWidget {
  const CustomAppBarTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Hello, Fayozbek",
            style: const AppTextStyle().bodyMedium,
          ),
          Text(
            "Good Morning!",
            style: const AppTextStyle().labelLarge?.copyWith(fontSize: 20.w),
          ),
        ],
      ),
    );
  }
}
