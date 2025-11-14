import 'package:get/get.dart';

import '../controllers/input_profile_controller.dart';

class InputProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputProfileController>(
      () => InputProfileController(Get.find()),
    );
  }
}
