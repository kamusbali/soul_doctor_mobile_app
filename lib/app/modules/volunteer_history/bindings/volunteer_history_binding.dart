import 'package:get/get.dart';

import '../controllers/volunteer_history_controller.dart';

class VolunteerHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VolunteerHistoryController>(
      () => VolunteerHistoryController(),
    );
  }
}
