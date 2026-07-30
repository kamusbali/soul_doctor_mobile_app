import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../repository/reminder_care_task_repository.dart';

class DeleteReminderCareTaskUseCase {
  final ReminderCareTaskRepository _reminderCareTaskRepository;

  DeleteReminderCareTaskUseCase(this._reminderCareTaskRepository);

  Future<Either<Failure, void>> execute({required String reminderId}) async {
    return await _reminderCareTaskRepository.deleteReminderCareTask(
      reminderId: reminderId,
    );
  }
}
