import 'package:get/get.dart';

import '../controllers/report_daily_patient_controller.dart';

class ReportDailyPatientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportDailyPatientController>(
      () => ReportDailyPatientController(Get.find(), Get.find()),
    );
  }
}
