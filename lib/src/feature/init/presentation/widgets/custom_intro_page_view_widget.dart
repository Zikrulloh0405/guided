import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../generated/assets.dart';
import '../../../../common/styles/text_style.dart';

class CustomIntroPageViewWidget extends StatelessWidget {
  const CustomIntroPageViewWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.content,
  });

  final String title;
  final String subTitle;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const AppTextStyle().titleLarge,
          ),
          Text(
            subTitle,
            style: const AppTextStyle().titleMedium,
          ),
          Container(
            alignment: Alignment.center,
            height: 400.h,
            child: Lottie.asset(Assets.lottieInitLottieOne, fit: BoxFit.cover),
          ),
          Text(
            content,
            style: const AppTextStyle().titleSmall,
          ),
        ],
      ),
    );
  }
}
