import 'package:get/get.dart';

import '../controllers/volunteer_home_controller.dart';

class VolunteerHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VolunteerHomeController>(
      () => VolunteerHomeController(Get.find(), Get.find()),
    );
  }
}
