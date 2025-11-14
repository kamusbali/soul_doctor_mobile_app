import 'package:get/get.dart';

import '../controllers/patient_detail_history_controller.dart';

class PatientDetailHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PatientDetailHistoryController>(
      () => PatientDetailHistoryController(Get.find()),
    );
  }
}
