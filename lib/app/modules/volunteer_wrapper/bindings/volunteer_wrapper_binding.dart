import 'package:get/get.dart';

import '../controllers/volunteer_wrapper_controller.dart';

class VolunteerWrapperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VolunteerWrapperController>(
      () => VolunteerWrapperController(),
    );
  }
}
