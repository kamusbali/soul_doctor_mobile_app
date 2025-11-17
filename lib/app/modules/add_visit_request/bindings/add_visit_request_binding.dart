import 'package:get/get.dart';

import '../controllers/add_visit_request_controller.dart';

class AddVisitRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddVisitRequestController>(
      () => AddVisitRequestController(Get.find(), Get.find()),
    );
  }
}
