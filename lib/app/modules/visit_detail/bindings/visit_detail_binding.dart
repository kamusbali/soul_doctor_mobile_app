import 'package:get/get.dart';

import '../controllers/visit_detail_controller.dart';

class VisitDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisitDetailController>(
      () => VisitDetailController(Get.find(), Get.find(), Get.find()),
    );
  }
}
