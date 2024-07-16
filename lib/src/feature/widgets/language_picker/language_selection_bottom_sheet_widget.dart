/*
* This widget is for language picking logic , when it comes from bottom sheet, mostly it will be used in the main part
* */

import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:guidist/src/common/utils/extensions/context_extensions.dart";

import "../../../common/widget/app_material_context.dart";
import "custom_language_picker_widget.dart";

class LanguageSelectionBottomSheetWidget extends StatelessWidget {
  const LanguageSelectionBottomSheetWidget(
      {super.key,
        required this.onRussianPressed,
        required this.onUzbekPressed,
        required this.onEnglishPressed,
        required this.selectedLanguage});

  final VoidCallback onRussianPressed;
  final VoidCallback onUzbekPressed;
  final VoidCallback onEnglishPressed;
  final String selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 357.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
          // color: Colors.red
          color: context.theme.colorScheme.background),
      child: Column(
        children: <Widget>[
          // modal bar
          Container(
            width: 36.w,
            margin: EdgeInsets.symmetric(
              vertical: 12.0.r,
            ),
            height: 5.h,
            decoration: BoxDecoration(
                color: context.theme.colorScheme.onTertiary,
                borderRadius: BorderRadius.circular(2.5.r)),
          ),
          CustomLanguagePickerWidget(
            // shouldGoNext: false,
            localControllerVm: localController,
          )
        ],
      ),
    );
  }
}