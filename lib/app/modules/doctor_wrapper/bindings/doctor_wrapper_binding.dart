import 'package:get/get.dart';

import '../controllers/doctor_wrapper_controller.dart';

class DoctorWrapperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorWrapperController>(
      () => DoctorWrapperController(),
    );
  }
}
