import 'package:dartz/dartz.dart' show Either;

import '../../../core/error/failure.dart';
import '../../repository/reminder_care_task_repository.dart';

class CreateReminderCareTaskUseCase {
  final ReminderCareTaskRepository _reminderCareTaskRepository;

  CreateReminderCareTaskUseCase(this._reminderCareTaskRepository);

  Future<Either<Failure, void>> execute({
    required String patientId,
    required DateTime startDate,
    required DateTime endDate,
    required String title,
    required String description,
    required int frequency,
  }) async {
    return await _reminderCareTaskRepository.createReminderCareTask(
      patientId: patientId,
      startDate: startDate,
      endDate: endDate,
      title: title,
      description: description,
      frequency: frequency,
    );
  }
}
