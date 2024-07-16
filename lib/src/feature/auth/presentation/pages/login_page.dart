import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:guidist/src/common/styles/app_colors.dart';
import 'package:guidist/src/common/styles/text_style.dart';
import 'package:guidist/src/common/utils/extensions/context_extensions.dart';
import 'package:guidist/src/feature/widgets/custom_simple_button.dart';
import 'package:guidist/src/feature/auth/controller/auth_controller.dart';

import '../../../../../generated/assets.dart';
import '../../../../common/routes/app_route_name.dart';
import '../../../../data/entity/user_model.dart';
import '../widgets/custom_text_field.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AuthController con = ref.watch(authController);

    return Scaffold(
      backgroundColor: AppColors.bckgrColor,
      body: Padding(
        padding: EdgeInsets.all(30.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                "Login to your account",
                style: const AppTextStyle().titleLarge,
              ),
              const Spacer(),
              CustomTextField(
                headerText: "Email",
                controller: con.emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!value.endsWith("@gmail.com")) {
                    return 'Email should end with "@gmail.com"';
                  }
                  return null;
                },
              ),
              // SizedBox(
              //   height: 20.h,
              // ),
              CustomTextField(
                headerText: "Password",
                controller: con.passwordController,
                obscureText: con.isPasswordVisible,
                changePasswordVisibility: con.setPasswordVisibility,
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password should be at least 6 characters';
                  }
                  return null;
                },
              ),
              Align(
                alignment: Alignment.topRight,
                child: MaterialButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Text(
                    "Forgot Password? ",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.c757575,
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 20.h,
              // ),
              const Spacer(
                flex: 6,
              ),
              CustomSimpleButton(
                height: 50.h,
                width: double.infinity,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await con.loginWithEmailAndPassword();
                    if (con.currentUser != null) {
                      // Navigate based on role
                      if (con.currentUser!.role == UserRole.tourist) {
                        context.go(AppRouteName.touristHomePage);
                      } else {
                        context.go(AppRouteName.touristHomePage);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Login failed')),
                      );
                    }
                  }
                },
                color: AppColors.btnColor,
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 24.sp, color: AppColors.white),
                ),
              ),
              Spacer(),
              CustomSimpleButton(
                height: 50.h,
                width: double.infinity,
                onPressed: () {},
                color: const Color(0xffE0E0E0),
                child: SvgPicture.asset(
                  Assets.iconsGoogle,
                ),
              ),
              // SizedBox(
              //   height: 20.h,
              // ),
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?  ",
                    style: const AppTextStyle().bodyLarge?.copyWith(
                          fontSize: 13.sp,
                          color: const Color(0xff757575),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  InkWell(
                    onTap: () {
                      context.push(AppRouteName.createAccountPage);
                    },
                    splashColor: Colors.grey,
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
