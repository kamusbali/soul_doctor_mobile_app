import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../data/source/local/dto/calendar_reminder_local_dto.dart';
import '../../model/calendar_reminder.dart';
import '../../repository/reminder_calendar_repository.dart';

class GetAllReminderCalendarUseCase {
  final ReminderCalendarRepository reminderCalendarRepository;

  GetAllReminderCalendarUseCase(this.reminderCalendarRepository);

  Either<Failure, List<CalendarReminder>> execute() {
    return reminderCalendarRepository.getAllReminderCalendar().fold(
      (failure) => Left(failure),
      (calendarReminders) {
        return Right(
          calendarReminders.map((dto) => dto.toCalendarReminder()).toList(),
        );
      },
    );
  }
}
