/*
* This  is Language Picker main widget
* */
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";
import "package:guidist/src/common/routes/app_route_name.dart";
import "package:guidist/src/common/styles/app_colors.dart";
import "../../../../../../generated/assets.dart";
import "../../../common/widget/app_material_context.dart";
import "../../settings/inherited/local_controller.dart";
import "../../settings/model/language_type.dart";
import "custom_each_language_picker_widget.dart";

class CustomLanguagePickerWidget extends StatelessWidget {
  const CustomLanguagePickerWidget({
    super.key,
    required this.localControllerVm,
    // required this.shouldGoNext
  });

  final LocalController localControllerVm;

  // final bool shouldGoNext;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          onTap: context.pop,
          leading: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: const Icon(Icons.cancel),
          ),
          title: const Center(child: Text("Choose Language")),
          titleTextStyle: TextStyle(
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
        // const SizedBox(height: 20),
        CustomEachLanguagePickerWidget(
          context: context,
          onSelect: () {
            // shouldGoNext
            //     ? context.go(AppRouteName.infoPage)
            //     : context.pop();
            localControllerVm.changeLocal(LanguageType.uz);
          },
          language: "O'zbekcha",
          selected: localController.selectedLanguage == "uz",
          countryFlag: Assets.iconsUzbFlag,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomEachLanguagePickerWidget(
          context: context,
          onSelect: () {
            // shouldGoNext
            //     ? context.go(AppRouteName.infoPage)
            //     : context.pop();
            localControllerVm.changeLocal(LanguageType.ru);
          },
          language: "Русский",
          selected: localController.selectedLanguage == "ru",
          countryFlag: Assets.iconsRussiaFlag,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomEachLanguagePickerWidget(
          context: context,
          onSelect: () {
            // shouldGoNext
            //     ? context.go(AppRouteName.infoPage)
            //     : context.pop();
            localControllerVm.changeLocal(LanguageType.en);
          },
          language: "English",
          selected: localController.selectedLanguage == "en",
          countryFlag: Assets.iconsUsaFlag,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomEachLanguagePickerWidget(
          context: context,
          onSelect: () {
            // shouldGoNext
            //     ? context.go(AppRouteName.infoPage)
            //     : context.pop();
            localControllerVm.changeLocal(LanguageType.fr);
          },
          language: "Français",
          selected: localController.selectedLanguage == "fr",
          countryFlag: Assets.iconsFranceFlag,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomEachLanguagePickerWidget(
          context: context,
          onSelect: () {
            // shouldGoNext
            //     ? context.go(AppRouteName.infoPage)
            //     : context.pop();
            localControllerVm.changeLocal(LanguageType.ch);
          },
          language: "中国人",
          selected: localController.selectedLanguage == "ch",
          countryFlag: Assets.iconsChinaFlag,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomEachLanguagePickerWidget(
          context: context,
          onSelect: () {
            // shouldGoNext
            //     ? context.go(AppRouteName.infoPage)
            //     : context.pop();
            localControllerVm.changeLocal(LanguageType.tr);
          },
          language: "Türkçe",
          selected: localController.selectedLanguage == "tr",
          countryFlag: Assets.iconsTurkeyFlag,
        ),
        SizedBox(
          height: 30.h,
        ),
        MaterialButton(
          onPressed: () {
            context.go(AppRouteName.landingPage);
          },
          color: AppColors.btnColor,
          minWidth: 200.w,
          height: 50.h,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
          child: Text(
            "Continue",
            style: TextStyle(
              fontSize: 20.sp,
              color: AppColors.white,
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}
