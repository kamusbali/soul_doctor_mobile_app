import 'package:get/get.dart';

import '../controllers/patient_wrapper_controller.dart';

class PatientWrapperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PatientWrapperController>(
      () => PatientWrapperController(),
    );
  }
}
