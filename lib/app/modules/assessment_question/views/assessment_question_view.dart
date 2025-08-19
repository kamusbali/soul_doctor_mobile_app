import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/modules/assessment_question/widgets/list_answer.dart';
import 'package:soul_doctor/app/utils/theme/color_theme.dart';
import 'package:soul_doctor/app/utils/theme/spacing_theme.dart';
import 'package:soul_doctor/app/utils/theme/text_style_theme.dart';

import '../../../common/resource.dart';
import '../controllers/assessment_question_controller.dart';

class AssessmentQuestionView extends GetView<AssessmentQuestionController> {
  const AssessmentQuestionView({super.key});
  @override
  Widget build(BuildContext context) {
    ever(controller.questionState, (state) {
      switch (state.status) {
        case Status.error:
          Get.snackbar(
            "Error",
            state.message?.tr ?? "Unexpected Error Occured",
          );
          break;
        default:
          break;
      }
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: SpacingTheme.SPACING_8,
              vertical: SpacingTheme.SPACING_11,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: Get.width,
                  child: Text(
                    "Dalam 2 minggu terakhir, seberapa sering kamu merasa sedih atau kosong?",
                    style: TextStyleTheme.HEADING_3.copyWith(
                      fontWeight: FontWeight.w500,
                      color: ColorTheme.TEXT_100,
                    ),
                  ),
                ),
                SizedBox(height: SpacingTheme.SPACING_5),
                SizedBox(
                  width: Get.width,
                  child: Text(
                    "Perasaan sedih atau hampa yang berlangsung terus-menerus bisa menjadi tanda awal gangguan seperti depresi.",
                    style: TextStyleTheme.PARAGRAPH_5.copyWith(
                      color: ColorTheme.TEXT_100,
                    ),
                  ),
                ),

                SizedBox(height: SpacingTheme.SPACING_13),
                SizedBox(
                  width: Get.width,
                  child: Text(
                    "Pilih salah satu",
                    style: TextStyleTheme.LABEL_5.copyWith(
                      color: ColorTheme.CRIMSON_500,
                    ),
                  ),
                ),
                SizedBox(height: SpacingTheme.SPACING_10),
                Obx(
                  () => Column(
                    spacing: SpacingTheme.SPACING_5,
                    children: controller.listAnswer.asMap().entries.map((
                      element,
                    ) {
                      return ListAnswer(
                        answer: element.value,
                        isSelected:
                            element.key == controller.selectedAnswerIndex.value,
                        onTap: () {
                          controller.onChangeSelectedAnswerIndex(element.key);
                        },
                      );
                    }).toList(),
                  ),
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
            controller.onAnswerQuestion();
          },
          child: Text(
            "Jawab",
            style: TextStyleTheme.LABEL_1.copyWith(
              color: ColorTheme.NEUTRAL_100,
            ),
          ),
        ),
      ),
    );
  }
}
