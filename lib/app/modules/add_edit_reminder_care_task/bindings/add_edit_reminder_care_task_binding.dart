import 'package:get/get.dart';

import '../controllers/add_edit_reminder_care_task_controller.dart';

class AddEditReminderCareTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditReminderCareTaskController>(
      () => AddEditReminderCareTaskController(Get.find(), Get.find()),
    );
  }
}
