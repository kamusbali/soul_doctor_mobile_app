import 'package:get/get.dart';

import '../controllers/diagnosis_form_controller.dart';

class DiagnosisFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiagnosisFormController>(
      () => DiagnosisFormController(),
    );
  }
}
