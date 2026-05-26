import 'package:dartz/dartz.dart';

import 'package:soul_doctor/app/core/error/failure.dart';

import 'package:soul_doctor/app/data/source/local/dto/calendar_reminder_local_dto.dart';

import '../../domain/repository/reminder_calendar_repository.dart';
import '../source/local/provider/reminder_calendar_provider.dart';

class ReminderCalendarRepositoryImpl implements ReminderCalendarRepository {
  final ReminderCalendarProvider _reminderCalendarProvider;

  ReminderCalendarRepositoryImpl(this._reminderCalendarProvider);
  @override
  Future<Either<Failure, bool>> addReminderCalendar({
    required String title,
    required String description,
    required DateTime dateTime,
  }) async {
    try {
      await _reminderCalendarProvider.addReminderCalendarData(
        title: title,
        description: description,
        dateTime: dateTime,
      );
      return Right(true);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteReminderCalendar(String id) async {
    try {
      await _reminderCalendarProvider.deleteReminderCalendarData(id);
      return Right(true);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Either<Failure, List<CalendarReminderLocalDto>> getAllReminderCalendar() {
    return _reminderCalendarProvider.getAllReminderCalendarData();
  }

  @override
  Future<Either<Failure, bool>> updateReminderCalendar({
    required String id,
    required String title,
    required String description,
    required DateTime dateTime,
  }) async {
    try {
      await _reminderCalendarProvider.updateReminderCalendarData(
        id: id,
        title: title,
        description: description,
        dateTime: dateTime,
      );
      return Right(true);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
