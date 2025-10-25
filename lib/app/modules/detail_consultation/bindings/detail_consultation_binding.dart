import 'package:get/get.dart';

import '../controllers/detail_consultation_controller.dart';

class DetailConsultationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailConsultationController>(
      () => DetailConsultationController(Get.find(), Get.find()),
    );
  }
}
