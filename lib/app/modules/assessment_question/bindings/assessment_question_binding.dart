import 'package:get/get.dart';

import '../controllers/assessment_question_controller.dart';

class AssessmentQuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssessmentQuestionController>(
      () => AssessmentQuestionController(),
    );
  }
}
