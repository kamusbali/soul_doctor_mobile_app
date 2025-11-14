import 'package:get/get.dart';

import '../controllers/consultation_request_detail_controller.dart';

class ConsultationRequestDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConsultationRequestDetailController>(
      () => ConsultationRequestDetailController(),
    );
  }
}
