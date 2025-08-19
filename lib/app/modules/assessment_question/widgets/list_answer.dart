import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/utils/theme/color_theme.dart';
import 'package:soul_doctor/app/utils/theme/spacing_theme.dart';
import 'package:soul_doctor/app/utils/theme/text_style_theme.dart';

class ListAnswer extends StatelessWidget {
  const ListAnswer({
    super.key,
    required this.answer,
    required this.isSelected,
    required this.onTap,
  });

  final String answer;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(
          horizontal: SpacingTheme.SPACING_8,
          vertical: SpacingTheme.SPACING_6,
        ),
        decoration: BoxDecoration(
          color: isSelected ? ColorTheme.CRIMSON_200 : ColorTheme.NEUTRAL_100,
          borderRadius: BorderRadius.circular(SpacingTheme.SPACING_5),
          border: BoxBorder.all(
            color: isSelected ? ColorTheme.CRIMSON_500 : ColorTheme.NEUTRAL_500,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "Kadang-kadang",
                style: TextStyleTheme.LABEL_3.copyWith(
                  color: isSelected
                      ? ColorTheme.CRIMSON_500
                      : ColorTheme.TEXT_PLACEHOLDER,
                ),
              ),
            ),
            if (isSelected)
              Icon(
                Amicons.flaticon_check_rounded,
                color: ColorTheme.CRIMSON_500,
                size: 16,
              ),
          ],
        ),
      ),
    );
  }
}
