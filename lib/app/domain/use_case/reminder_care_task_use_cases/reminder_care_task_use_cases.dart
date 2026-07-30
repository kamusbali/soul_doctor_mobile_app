import 'package:soul_doctor/app/domain/use_case/reminder_care_task_use_cases/get_reminder_care_task_use_case.dart';

import 'create_reminder_care_task_use_case.dart';
import 'delete_reminder_care_task_use_case.dart';
import 'mark_as_done_reminder_care_task_use_case.dart';

class ReminderCareTaskUseCases {
  final CreateReminderCareTaskUseCase createReminderCareTaskUseCase;
  final GetReminderCareTaskUseCase getReminderCareTasksUseCase;
  final MarkAsDoneReminderCareTaskUseCase markAsDoneReminderCareTaskUseCase;
  final DeleteReminderCareTaskUseCase deleteReminderCareTaskUseCase;

  ReminderCareTaskUseCases({
    required this.createReminderCareTaskUseCase,
    required this.getReminderCareTasksUseCase,
    required this.markAsDoneReminderCareTaskUseCase,
    required this.deleteReminderCareTaskUseCase,
  });
}
