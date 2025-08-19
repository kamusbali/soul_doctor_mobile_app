import 'package:get/get.dart';

import '../controllers/assessment_result_controller.dart';

class AssessmentResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssessmentResultController>(
      () => AssessmentResultController(),
    );
  }
}
