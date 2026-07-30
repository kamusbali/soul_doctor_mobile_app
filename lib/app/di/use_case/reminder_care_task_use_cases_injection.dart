import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/use_case/reminder_care_task_use_cases/get_reminder_care_task_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/reminder_care_task_use_cases/mark_as_done_reminder_care_task_use_case.dart';

import '../../domain/use_case/reminder_care_task_use_cases/create_reminder_care_task_use_case.dart';
import '../../domain/use_case/reminder_care_task_use_cases/delete_reminder_care_task_use_case.dart';
import '../../domain/use_case/reminder_care_task_use_cases/reminder_care_task_use_cases.dart';

class ReminderCareTaskUseCasesInjection {
  static void inject() {
    Get.lazyPut(() => GetReminderCareTaskUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => CreateReminderCareTaskUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => DeleteReminderCareTaskUseCase(Get.find()), fenix: true);
    Get.lazyPut(
      () => MarkAsDoneReminderCareTaskUseCase(Get.find()),
      fenix: true,
    );

    Get.lazyPut(
      () => ReminderCareTaskUseCases(
        createReminderCareTaskUseCase: Get.find(),
        deleteReminderCareTaskUseCase: Get.find(),
        markAsDoneReminderCareTaskUseCase: Get.find(),
        getReminderCareTasksUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
