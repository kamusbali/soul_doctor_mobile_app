import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';
import 'package:soul_doctor/app/core/theme/text_style_theme.dart';

class PlaceholderNoData extends StatelessWidget {
  const PlaceholderNoData({super.key, required this.title});

  final String title;

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
        title,
        style: TextStyleTheme.LABEL_3.copyWith(
          color: ColorTheme.TEXT_PLACEHOLDER,
        ),
      ),
    );
  }
}
