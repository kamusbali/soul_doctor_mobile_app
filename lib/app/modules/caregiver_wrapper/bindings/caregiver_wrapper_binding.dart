import 'package:get/get.dart';

import '../controllers/caregiver_wrapper_controller.dart';

class CaregiverWrapperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CaregiverWrapperController>(
      () => CaregiverWrapperController(),
    );
  }
}
