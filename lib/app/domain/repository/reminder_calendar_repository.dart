import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../data/source/local/dto/calendar_reminder_local_dto.dart';
import '../model/repeat_calendar_reminder.dart';

abstract class ReminderCalendarRepository {
  Either<Failure, List<CalendarReminderLocalDto>> getAllReminderCalendar();
  Future<Either<Failure, bool>> addReminderCalendar({
    required String title,
    required String description,
    required DateTime dateTime,
    required RepeatCalendarReminder repeatInterval,
    required List<DateTime> isDoneDateTime,
  });

  Future<Either<Failure, bool>> deleteReminderCalendar(String id);
  Future<Either<Failure, bool>> updateReminderCalendar({
    required String id,
    required String title,
    required String description,
    required DateTime dateTime,
    required bool isSynced,
    required RepeatCalendarReminder repeatInterval,
    required List<DateTime> isDoneDateTime,
  });
}
