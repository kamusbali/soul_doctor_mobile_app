import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/common/constant/const_path.dart';
import 'package:soul_doctor/app/modules/assessment_question/widgets/list_answer.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';
import 'package:soul_doctor/app/core/theme/text_style_theme.dart';
import 'package:soul_doctor/app/widgets/progress_bar/animated_progress_bar.dart';

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
      appBar: AppBar(
        title: Image.asset(ConstPath.ICON_APP_PATH, height: 30),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: SpacingTheme.SPACING_8,
              vertical: SpacingTheme.SPACING_11,
            ),
            child: Obx(
              () => Column(
                children: [
                  SizedBox(height: SpacingTheme.SPACING_13),
                  SizedBox(
                    width: Get.width,
                    child: Text(
                      "Pertanyaan ${controller.currentQuestion.value + 1} dari ${controller.questions.length}",
                    ),
                  ),
                  SizedBox(height: SpacingTheme.SPACING_3),
                  AnimatedProgressBar(
                    value: controller.currentQuestion.value.toDouble(),
                    total: controller.questions.length.toDouble(),
                  ),
                  SizedBox(height: SpacingTheme.SPACING_13),
                  SizedBox(
                    width: Get.width,
                    child: Text(
                      controller
                          .questions[controller.currentQuestion.value]
                          .question,
                      style: TextStyleTheme.HEADING_3.copyWith(
                        fontWeight: FontWeight.w500,
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
                  ListAnswer(
                    answer: "Iya",
                    isSelected: controller.selectedAnswerIndex.value == 1,
                    onTap: () {
                      controller.onChangeSelectedAnswerIndex(1);
                    },
                  ),
                  SizedBox(height: SpacingTheme.SPACING_4),
                  ListAnswer(
                    answer: "Tidak",
                    isSelected: controller.selectedAnswerIndex.value == 0,
                    onTap: () {
                      controller.onChangeSelectedAnswerIndex(0);
                    },
                  ),
                ],
              ),
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
              child: Obx(
                () => OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(99),
                    ),
                    side: BorderSide(
                      color: controller.currentQuestion.value == 0
                          ? ColorTheme.NEUTRAL_500.withAlpha(129)
                          : ColorTheme.NEUTRAL_500,
                    ),
                  ),

                  onPressed: controller.currentQuestion.value == 0
                      ? null
                      : () {
                          controller.onBackQuestion();
                        },
                  child: Text(
                    "Sebelumnya",
                    style: TextStyleTheme.LABEL_1.copyWith(
                      color: controller.currentQuestion.value == 0
                          ? ColorTheme.TEXT_PLACEHOLDER.withAlpha(129)
                          : ColorTheme.TEXT_PLACEHOLDER,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FilledButton(
                onPressed: () {
                  controller.onNextQuestion();
                },
                child: Text(
                  "Lanjut",
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
