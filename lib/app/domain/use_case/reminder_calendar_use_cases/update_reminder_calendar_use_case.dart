import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../repository/reminder_calendar_repository.dart';

class UpdateReminderCalendarUseCase {
  final ReminderCalendarRepository _reminderCalendarRepository;

  UpdateReminderCalendarUseCase(this._reminderCalendarRepository);

  Future<Either<Failure, bool>> execute({
    required String id,
    required String title,
    required String description,
    required DateTime dateTime,
  }) async {
    return await _reminderCalendarRepository.updateReminderCalendar(
      id: id,
      title: title,
      description: description,
      dateTime: dateTime,
    );
  }
}
