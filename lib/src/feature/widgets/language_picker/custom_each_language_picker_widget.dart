/*
* This  widget is for each language card
* */
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:guidist/src/common/styles/app_colors.dart";
import "package:guidist/src/common/utils/extensions/context_extensions.dart";

class CustomEachLanguagePickerWidget extends StatelessWidget {
  const CustomEachLanguagePickerWidget({
    super.key,
    required this.context,
    required this.onSelect,
    required this.language,
    required this.selected,
    required this.countryFlag,
  });

  final BuildContext context;

  final VoidCallback onSelect;
  final String language;
  final bool selected;
  final String countryFlag;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: BorderSide(
          color: selected ? Colors.green : Colors.white,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      surfaceTintColor: context.theme.colorScheme.secondaryContainer,
      // color: const Color(0xff9498A1),
      child: ListTile(
        focusColor: AppColors.white,
        selectedTileColor: AppColors.white,
        onTap: onSelect,
        title: Text(language, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500)
            // TextStyle(color: context.theme.colorScheme.onSecondaryContainer),
            ),
        leading: Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              // color: Color(0xff9C9595),
              borderRadius: BorderRadius.circular(
                8.r,
              ),
            ),
            child: SvgPicture.asset(countryFlag, fit: BoxFit.fill)),
        trailing: Icon(selected ? Icons.check_circle_outline_outlined : Icons.radio_button_checked_sharp,
            color: selected ? Colors.green : Colors.grey),
      ),
    );
  }
}
