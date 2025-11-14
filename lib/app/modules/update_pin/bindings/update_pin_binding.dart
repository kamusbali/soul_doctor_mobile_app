import 'package:get/get.dart';

import '../controllers/update_pin_controller.dart';

class UpdatePinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdatePinController>(() => UpdatePinController(Get.find()));
  }
}
