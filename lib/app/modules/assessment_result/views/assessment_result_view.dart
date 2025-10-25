import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';

import '../../../core/theme/color_theme.dart';
import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
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

                if (!controller.isGood) ...[
                  SizedBox(height: SpacingTheme.SPACING_8),
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.all(SpacingTheme.SPACING_8),
                    decoration: BoxDecoration(
                      color: ColorTheme.CRIMSON_200,
                      borderRadius: BorderRadius.circular(
                        SpacingTheme.SPACING_2,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detail Hasil Screening:",
                          style: TextStyleTheme.LABEL_1.copyWith(
                            color: ColorTheme.CRIMSON_800,
                          ),
                        ),
                        SizedBox(height: SpacingTheme.SPACING_6),
                        if (controller.score.stress != 0) ...[
                          ListScore(
                            title: "Stress",
                            score: controller.score.stress,
                          ),
                          SizedBox(height: SpacingTheme.SPACING_4),
                        ],
                        if (controller.score.depression != 0) ...[
                          ListScore(
                            title: "Depresi",
                            score: controller.score.depression,
                          ),
                          SizedBox(height: SpacingTheme.SPACING_4),
                        ],
                        if (controller.score.anxiety != 0) ...[
                          ListScore(
                            title: "Kecemasan",
                            score: controller.score.anxiety,
                          ),
                          SizedBox(height: SpacingTheme.SPACING_4),
                        ],
                        if (controller.score.psychosis != 0) ...[
                          ListScore(
                            title: "Psikosi",
                            score: controller.score.psychosis,
                          ),
                        ],
                        SizedBox(height: SpacingTheme.SPACING_6),
                        Container(
                          width: Get.width,
                          padding: EdgeInsets.all(SpacingTheme.SPACING_8),
                          decoration: BoxDecoration(
                            color: ColorTheme.DEEP_LEMON_200,
                            border: Border.all(
                              color: ColorTheme.DEEP_LEMON_500,
                            ),
                            borderRadius: BorderRadius.circular(
                              SpacingTheme.SPACING_2,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Penting untuk diketahui:",
                                style: TextStyleTheme.LABEL_4.copyWith(
                                  color: ColorTheme.DEEP_LEMON_800,
                                ),
                              ),
                              Text(
                                "Hasil ini merupakan skrining awal dan tidak menggantikan diagnosis profesional.",
                                style: TextStyleTheme.LABEL_5.copyWith(
                                  color: ColorTheme.DEEP_LEMON_800,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
        child: Row(
          spacing: 16,
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  Get.offNamed(Routes.ASSESSMENT_QUESTION);
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: ColorTheme.CRIMSON_500),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(99),
                  ),
                ),
                child: Text(
                  "Ulang Tes",
                  style: TextStyleTheme.LABEL_1.copyWith(
                    color: ColorTheme.CRIMSON_500,
                  ),
                ),
              ),
            ),
            Expanded(
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
          ],
        ),
      ),
    );
  }
}

class ListScore extends StatelessWidget {
  const ListScore({super.key, required this.title, required this.score});

  final String title;
  final double score;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SpacingTheme.SPACING_4,
        vertical: SpacingTheme.SPACING_4,
      ),
      decoration: BoxDecoration(
        color: ColorTheme.NEUTRAL_100,
        border: Border.all(color: ColorTheme.NEUTRAL_500),
        borderRadius: BorderRadius.circular(SpacingTheme.SPACING_2),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyleTheme.LABEL_1.copyWith(
                color: ColorTheme.CRIMSON_800,
              ),
            ),
          ),
          for (var i = 0; i < score; i++)
            Icon(
              Amicons.flaticon_shield_exclamation_rounded_fill,
              color: ColorTheme.CRIMSON_500,
            ),
        ],
      ),
    );
  }
}
