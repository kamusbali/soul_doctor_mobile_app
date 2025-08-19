import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/theme/color_theme.dart';
import '../../../utils/theme/spacing_theme.dart';
import '../../../utils/theme/text_style_theme.dart';
import '../controllers/assessment_result_controller.dart';

class AssessmentResultView extends GetView<AssessmentResultController> {
  const AssessmentResultView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(SpacingTheme.SPACING_8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(controller.imagePath, height: 300, width: 300),
                SizedBox(height: SpacingTheme.SPACING_12),
                Text(
                  controller.title,
                  style: TextStyleTheme.HEADING_3.copyWith(
                    color: ColorTheme.TEXT_100,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SpacingTheme.SPACING_5),
                Text(
                  controller.body,
                  style: TextStyleTheme.PARAGRAPH_5.copyWith(
                    color: ColorTheme.TEXT_100,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: SpacingTheme.SPACING_8,
          right: SpacingTheme.SPACING_8,
          bottom: SpacingTheme.SPACING_13,
          top: SpacingTheme.SPACING_8,
        ),
        width: Get.width,
        child: FilledButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            "Kembali ke Beranda",
            style: TextStyleTheme.LABEL_1.copyWith(
              color: ColorTheme.NEUTRAL_100,
            ),
          ),
        ),
      ),
    );
  }
}
