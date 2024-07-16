import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:guidist/src/common/routes/app_route_name.dart';
import 'package:guidist/src/common/styles/app_colors.dart';
import 'package:guidist/src/common/styles/text_style.dart';
import 'package:guidist/src/common/utils/extensions/context_extensions.dart';
import 'package:guidist/src/feature/auth/controller/auth_controller.dart';
import 'package:guidist/src/feature/auth/presentation/widgets/custom_text_field.dart';
import 'package:guidist/src/feature/widgets/custom_simple_button.dart';

import '../../../../../generated/assets.dart';

class CreateAccountPage extends ConsumerStatefulWidget {
  const CreateAccountPage({super.key});

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends ConsumerState<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AuthController con = ref.watch(authController);

    return Scaffold(
      backgroundColor: AppColors.bckgrColor,
      appBar: AppBar(
        backgroundColor: AppColors.bckgrColor,
        leading: con.currentPage >= 1
            ? IconButton(
                onPressed: () {
                  if (con.currentPage >= 1) {
                    con.pageController.animateToPage(
                      con.currentPage - 1,
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.linearToEaseOut,
                    );
                  }
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                ))
            : const SizedBox.shrink(),
        automaticallyImplyLeading: false,
        title: Text(
          "Create Account",
          style: TextStyle(fontSize: 30.sp, color: AppColors.black, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              height: 300.h,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: con.pageController,
                onPageChanged: (index) => con.setPageIndex(index),
                children: [
                  CustomRegisterFullNameWidget(controller: con.fullNameController),
                  CustomRegisterDateOfBirthWidget(controller: con.dateOfBirthController),
                  CustomRegisterEmailWidget(controller: con.emailController),
                  CustomRegisterPasswordWidget(
                    controller: con.passwordController,
                    obscureText: con.isPasswordVisible,
                    changePasswordVisibility: con.setPasswordVisibility,
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 4,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: MaterialButton(
                height: 50.h,
                minWidth: double.infinity,
                onPressed: () async {
                  if (con.currentPage < 3) {
                    con.pageController.animateToPage(
                      con.currentPage + 1,
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.linearToEaseOut,
                    );
                  } else {
                    if (_formKey.currentState!.validate()) {
                      await con.registerWithEmailAndPassword();
                      if (con.currentUser != null) {
                        context.go(AppRouteName.authSuccess);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Registration failed')),
                        );
                      }
                    }
                  }
                },
                color: AppColors.btnColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.r)),
                child: Text(
                  con.currentPage == 3 ? "Confirm" : "Next",
                  style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500, color: AppColors.white),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.localized.auth_create_account_already_have_account,
                  style: const AppTextStyle().bodyLarge?.copyWith(
                        fontSize: 13.sp,
                        color: const Color(0xffADAAAA),
                      ),
                ),
                InkWell(
                  onTap: () {
                    context.push(AppRouteName.loginPage);
                  },
                  splashColor: Colors.grey,
                  child: Text(
                    "Login",
                    style: const AppTextStyle().bodyLarge?.copyWith(fontSize: 13.8.sp),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class CustomRegisterPasswordWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback changePasswordVisibility;

  const CustomRegisterPasswordWidget({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.changePasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Create password",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
            headerText: "Password",
            isPassword: true,
            controller: controller,
            obscureText: obscureText,
            changePasswordVisibility: changePasswordVisibility,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              } else if (value.length < 6) {
                return 'Password should be at least 6 characters';
              }
              return null;
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
            headerText: "Confirm Password",
            obscureText: obscureText,
            isPassword: true,
            changePasswordVisibility: changePasswordVisibility,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              } else if (value != controller.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

class CustomRegisterDateOfBirthWidget extends StatelessWidget {
  final TextEditingController controller;

  const CustomRegisterDateOfBirthWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Enter your date of birth",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20.h,
          ),
          DropdownDatePicker(
            inputDecoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.cE0E0E0, width: 1.0),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.btnColor, width: 1.0),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.btnColor, width: 1.2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            hintDay: 'DD',
            hintMonth: 'MM',
            hintYear: 'YYYY',
            isDropdownHideUnderline: true,
            isFormValidator: true,
            startYear: 1980,
            endYear: DateTime.now().year,
            width: 5,
            onChangedDay: (String? day) {
              final parts = controller.text.split('/');
              final newDay = day?.padLeft(2, '0') ?? 'DD';
              final month = parts.length > 1 ? parts[1] : 'MM';
              final year = parts.length > 2 ? parts[2] : 'YYYY';
              controller.text = '$newDay/$month/$year';
            },
            onChangedMonth: (String? month) {
              final parts = controller.text.split('/');
              final newMonth = month?.padLeft(2, '0') ?? 'MM';
              final day = parts.length > 0 ? parts[0] : 'DD';
              final year = parts.length > 2 ? parts[2] : 'YYYY';
              controller.text = '$day/$newMonth/$year';
            },
            onChangedYear: (String? year) {
              final parts = controller.text.split('/');
              final newYear = year ?? 'YYYY';
              final day = parts.length > 0 ? parts[0] : 'DD';
              final month = parts.length > 1 ? parts[1] : 'MM';
              controller.text = '$day/$month/$newYear';
            },
          ),
        ],
      ),
    );
  }
}

class CustomRegisterEmailWidget extends StatelessWidget {
  final TextEditingController controller;

  const CustomRegisterEmailWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.localized.auth_create_account_enter_your_email,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
            headerText: "Email",
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (!value.endsWith("@email.com")) {
                return 'Email should end with "@email.com"';
              }
              return null;
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "or continue with",
            style: const AppTextStyle().bodyLarge,
          ),
          CustomSimpleButton(
            height: 50.h,
            elevation: 0,
            width: double.infinity,
            onPressed: () {},
            color: AppColors.cE0E0E0,
            child: SvgPicture.asset(
              Assets.iconsGoogle,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomRegisterFullNameWidget extends StatelessWidget {
  final TextEditingController controller;

  const CustomRegisterFullNameWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.localized.auth_create_account_header_enter_full_name,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
            headerText: "Full Name",
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
