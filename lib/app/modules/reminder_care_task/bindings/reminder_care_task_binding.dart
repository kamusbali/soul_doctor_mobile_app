import 'package:get/get.dart';

import '../controllers/reminder_care_task_controller.dart';

class ReminderCareTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReminderCareTaskController>(
      () => ReminderCareTaskController(Get.find(), Get.find()),
    );
  }
}
