import 'add_reminder_calendar_use_case.dart';
import 'delete_reminder_calendar_use_case.dart';
import 'get_all_reminder_calendar_use_case.dart';
import 'update_reminder_calendar_use_case.dart';

class ReminderCalendarUseCases {
  GetAllReminderCalendarUseCase getAllReminderCalendarUseCase;
  DeleteReminderCalendarUseCase deleteReminderCalendarUseCase;
  UpdateReminderCalendarUseCase updateReminderCalendarUseCase;
  AddReminderCalendarUseCase addReminderCalendarUseCase;

  ReminderCalendarUseCases({
    required this.getAllReminderCalendarUseCase,
    required this.deleteReminderCalendarUseCase,
    required this.updateReminderCalendarUseCase,
    required this.addReminderCalendarUseCase,
  });
}
