import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:guidist/generated/assets.dart';
import 'package:guidist/src/common/routes/app_route_name.dart';
import 'package:guidist/src/common/styles/app_colors.dart';
import 'package:guidist/src/common/styles/text_style.dart';
import 'package:guidist/src/common/utils/extensions/context_extensions.dart';
import 'package:guidist/src/feature/auth/controller/auth_controller.dart';
import 'package:guidist/src/feature/widgets/custom_simple_button.dart';
import 'package:lottie/lottie.dart';

import '../../../../data/entity/user_model.dart';

class ChoosePanel extends ConsumerWidget {
  const ChoosePanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthController con = ref.watch(authController);

    return Scaffold(
      backgroundColor: AppColors.bckgrColor,
      body: Padding(
        padding: EdgeInsets.all(30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: 1,
            ),
            SvgPicture.asset(Assets.iconsTravel),
            Text(
              context.localized.choose_panel_header,
              style: const AppTextStyle().titleLarge,
            ),
            SizedBox(
              height: 37.h,
            ),
            Text(
              context.localized.choose_panel_sub_header,
              style: const AppTextStyle().titleSmall,
            ),
            SizedBox(
              height: 37.h,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomSimpleButton(
                    color: AppColors.btnColor,
                    height: 50.h,
                    width: double.infinity,
                    onPressed: () {
                      con.setRole(UserRole.tourist);
                      context.go(AppRouteName.loginPage);
                    },
                    child: Text(
                      context.localized.choose_panel_button_tourist,
                      style: TextStyle(fontSize: 18.sp, color: AppColors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: CustomSimpleButton(
                    color: AppColors.white,
                    height: 50.h,
                    width: double.infinity,
                    onPressed: () {
                      con.setRole(UserRole.guide);
                      context.go(AppRouteName.loginPage);
                    },
                    child: Text(
                      context.localized.choose_panel_button_guide,
                      style: TextStyle(fontSize: 18.sp, color: AppColors.black),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
