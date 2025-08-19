import 'package:get/get.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';

import '../../../common/resource.dart';

class AssessmentQuestionController extends GetxController {
  List<String> listAnswer = <String>[
    "Tidak Pernah",
    "Kadang-kadang",
    "Sering",
    "Hampir setiap hari",
  ].obs;

  var selectedAnswerIndex = (-1).obs;

  final questionState = Resource<bool>.none().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onResetQuestion() {
    selectedAnswerIndex.value = -1;
  }

  void onChangeSelectedAnswerIndex(int index) {
    selectedAnswerIndex.value = index;
  }

  void onAnswerQuestion() {
    if (selectedAnswerIndex.value != -1 &&
        selectedAnswerIndex < listAnswer.length) {
      // Udah di jawab send jawaban

      // Udah jawab Semua
      if (true) {
        onResetQuestion();
        Get.offNamed(Routes.ASSESSMENT_RESULT);
      }
      return;
    }

    questionState.value = Resource.error("Silahkan jawab terlebih dahulu");
  }
}
