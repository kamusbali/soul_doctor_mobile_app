import 'package:get/get.dart';

import '../controllers/add_edit_reminder_calendar_controller.dart';

class AddEditReminderCalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditReminderCalendarController>(
      () => AddEditReminderCalendarController(Get.find()),
    );
  }
}
