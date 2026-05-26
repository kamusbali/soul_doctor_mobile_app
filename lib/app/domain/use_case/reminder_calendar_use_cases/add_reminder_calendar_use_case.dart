import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../repository/reminder_calendar_repository.dart';

class AddReminderCalendarUseCase {
  final ReminderCalendarRepository reminderCalendarRepository;

  AddReminderCalendarUseCase(this.reminderCalendarRepository);

  Future<Either<Failure, bool>> execute({
    required String title,
    required String description,
    required DateTime dateTime,
  }) {
    return reminderCalendarRepository.addReminderCalendar(
      title: title,
      description: description,
      dateTime: dateTime,
    );
  }
}
