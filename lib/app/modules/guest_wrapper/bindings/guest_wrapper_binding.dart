import 'package:get/get.dart';

import '../controllers/guest_wrapper_controller.dart';

class GuestWrapperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuestWrapperController>(
      () => GuestWrapperController(),
    );
  }
}
