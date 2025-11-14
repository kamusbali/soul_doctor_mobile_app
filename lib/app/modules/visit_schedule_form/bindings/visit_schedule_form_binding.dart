import 'package:get/get.dart';

import '../controllers/visit_schedule_form_controller.dart';

class VisitScheduleFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisitScheduleFormController>(
      () => VisitScheduleFormController(),
    );
  }
}
