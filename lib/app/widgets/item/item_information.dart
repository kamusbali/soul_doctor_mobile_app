import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';
import 'package:soul_doctor/app/core/theme/text_style_theme.dart';

class ItemInformation extends StatelessWidget {
  const ItemInformation({super.key, this.title, required this.value});

  final String? title;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: SpacingTheme.SPACING_4,
        children: [
          if (title != null) Text(title!, style: TextStyleTheme.LABEL_3),
          value,
        ],
      ),
    );
  }
}
