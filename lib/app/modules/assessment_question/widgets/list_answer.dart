import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';
import 'package:soul_doctor/app/core/theme/text_style_theme.dart';

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
          spacing: 16,
          children: [
            Container(
              width: 15,
              height: 15,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: BoxBorder.all(
                  color: isSelected
                      ? ColorTheme.CRIMSON_500
                      : ColorTheme.NEUTRAL_700,
                ),
              ),
              child: isSelected
                  ? Container(
                      decoration: BoxDecoration(
                        color: ColorTheme.CRIMSON_500,
                        shape: BoxShape.circle,
                      ),
                    )
                  : null,
            ),
            Expanded(
              child: Text(
                answer,
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
