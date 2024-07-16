import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:guidist/generated/assets.dart';

import '../../../../common/routes/app_route_name.dart';
import '../../../../common/styles/app_colors.dart';
import '../../../widgets/custom_simple_button.dart';

class AuthSuccess extends StatelessWidget {
  const AuthSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Registration completed \n successfully",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SvgPicture.asset(Assets.iconsCompleted),
              CustomSimpleButton(
                height: 50.h,
                width: double.infinity,
                onPressed: () {
                  context.go(AppRouteName.touristHomePage);
                },
                color: AppColors.btnColor,
                child: Text(
                  "Start Journey",
                  style: TextStyle(fontSize: 24.sp, color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
