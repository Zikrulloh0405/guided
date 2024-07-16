import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../generated/assets.dart';
import '../../../../../../common/styles/app_colors.dart';

class CustomFilterWidget extends StatelessWidget {
  const CustomFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      minWidth: double.infinity,
      height: 63.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: const BorderSide(color: AppColors.cE0E0E0),
      ),
      padding: EdgeInsets.zero,
      color: AppColors.white,
      onPressed: () {},
      child: SvgPicture.asset(
        Assets.iconsFiletr,
      ),
    );
  }
}
