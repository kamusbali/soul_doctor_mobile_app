import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../repository/reminder_care_task_repository.dart';

class MarkAsDoneReminderCareTaskUseCase {
  final ReminderCareTaskRepository _reminderCareTaskRepository;

  MarkAsDoneReminderCareTaskUseCase(this._reminderCareTaskRepository);

  Future<Either<Failure, void>> execute({required String reminderId}) async {
    return await _reminderCareTaskRepository.markAsDoneReminderCareTask(
      reminderId: reminderId,
    );
  }
}
