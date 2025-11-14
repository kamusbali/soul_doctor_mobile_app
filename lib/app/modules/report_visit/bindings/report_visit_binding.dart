import 'package:get/get.dart';

import '../controllers/report_visit_controller.dart';

class ReportVisitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportVisitController>(
      () => ReportVisitController(),
    );
  }
}
