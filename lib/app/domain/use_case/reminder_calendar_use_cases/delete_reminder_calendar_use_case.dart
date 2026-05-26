import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../repository/reminder_calendar_repository.dart';

class DeleteReminderCalendarUseCase {
  final ReminderCalendarRepository reminderCalendarRepository;

  DeleteReminderCalendarUseCase(this.reminderCalendarRepository);

  Future<Either<Failure, bool>> execute(String id) {
    return reminderCalendarRepository.deleteReminderCalendar(id);
  }
}
