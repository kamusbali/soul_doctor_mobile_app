import 'package:get/get.dart';

import '../controllers/report_daily_patient_detail_controller.dart';

class ReportDailyPatientDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportDailyPatientDetailController>(
      () => ReportDailyPatientDetailController(Get.find(), Get.find()),
    );
  }
}
