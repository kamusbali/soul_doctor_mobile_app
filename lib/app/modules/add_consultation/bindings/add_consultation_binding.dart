import 'package:get/get.dart';

import '../controllers/add_consultation_controller.dart';

class AddConsultationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddConsultationController>(
      () => AddConsultationController(Get.find(), Get.find()),
    );
  }
}
