import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:soul_doctor/app/utils/theme/color_theme.dart';
import 'package:soul_doctor/app/utils/theme/spacing_theme.dart';
import 'package:soul_doctor/app/utils/theme/text_style_theme.dart';

class ChipTagConsultation extends StatelessWidget {
  const ChipTagConsultation({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SpacingTheme.SPACING_6,
        vertical: SpacingTheme.SPACING_2,
      ),
      decoration: BoxDecoration(
        color: ColorTheme.NEUTRAL_400,
        border: Border.all(color: ColorTheme.NEUTRAL_500),
        borderRadius: BorderRadius.circular(SpacingTheme.SPACING_11),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: SpacingTheme.SPACING_2,
        children: [
          Text(
            title,
            style: TextStyleTheme.LABEL_5.copyWith(
              color: ColorTheme.TEXT_PLACEHOLDER,
            ),
          ),
          Icon(
            Amicons.flaticon_check_rounded,
            size: 16,
            color: ColorTheme.NEUTRAL_700,
          ),
        ],
      ),
    );
  }
}
