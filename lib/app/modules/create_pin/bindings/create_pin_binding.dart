import 'package:get/get.dart';

import '../controllers/create_pin_controller.dart';

class CreatePinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatePinController>(() => CreatePinController(Get.find()));
  }
}
