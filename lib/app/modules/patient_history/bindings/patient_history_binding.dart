import 'package:get/get.dart';

import '../controllers/patient_history_controller.dart';

class PatientHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PatientHistoryController>(
      () => PatientHistoryController(Get.find(), Get.find()),
      fenix: true,
    );
  }
}
