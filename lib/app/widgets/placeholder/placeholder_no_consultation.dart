import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/utils/theme/color_theme.dart';
import 'package:soul_doctor/app/utils/theme/spacing_theme.dart';
import 'package:soul_doctor/app/utils/theme/text_style_theme.dart';

class PlaceholderNoConsultation extends StatelessWidget {
  const PlaceholderNoConsultation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 80,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: SpacingTheme.SPACING_8,
        vertical: SpacingTheme.SPACING_6,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: ColorTheme.NEUTRAL_500),
        borderRadius: BorderRadius.circular(SpacingTheme.SPACING_5),
      ),
      child: Text(
        "Belum ada jadwal konsultasi",
        style: TextStyleTheme.LABEL_3.copyWith(
          color: ColorTheme.TEXT_PLACEHOLDER,
        ),
      ),
    );
  }
}
