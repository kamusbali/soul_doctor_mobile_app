import 'package:get/get.dart';

import '../controllers/reminder_care_task_list_patient_controller.dart';

class ReminderCareTaskListPatientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReminderCareTaskListPatientController>(
      () => ReminderCareTaskListPatientController(Get.find(), Get.find()),
    );
  }
}
