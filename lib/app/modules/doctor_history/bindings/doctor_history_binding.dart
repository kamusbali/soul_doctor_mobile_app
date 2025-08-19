import 'package:get/get.dart';

import '../controllers/doctor_history_controller.dart';

class DoctorHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorHistoryController>(
      () => DoctorHistoryController(),
    );
  }
}
