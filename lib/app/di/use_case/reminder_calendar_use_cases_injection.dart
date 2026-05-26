import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/use_case/reminder_calendar_use_cases/get_all_reminder_calendar_use_case.dart';

import '../../domain/use_case/reminder_calendar_use_cases/add_reminder_calendar_use_case.dart';
import '../../domain/use_case/reminder_calendar_use_cases/delete_reminder_calendar_use_case.dart';
import '../../domain/use_case/reminder_calendar_use_cases/reminder_calendar_use_cases.dart';
import '../../domain/use_case/reminder_calendar_use_cases/update_reminder_calendar_use_case.dart';

class ReminderCalendarUseCasesInjection {
  static void inject() {
    Get.lazyPut(() => GetAllReminderCalendarUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => AddReminderCalendarUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => DeleteReminderCalendarUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => UpdateReminderCalendarUseCase(Get.find()), fenix: true);

    Get.lazyPut(
      () => ReminderCalendarUseCases(
        getAllReminderCalendarUseCase: Get.find(),
        addReminderCalendarUseCase: Get.find(),
        deleteReminderCalendarUseCase: Get.find(),
        updateReminderCalendarUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
