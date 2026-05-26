import 'package:get/get.dart';

import '../controllers/reminder_calendar_controller.dart';

class ReminderCalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReminderCalendarController>(
      () => ReminderCalendarController(Get.find(), Get.find()),
    );
  }
}
