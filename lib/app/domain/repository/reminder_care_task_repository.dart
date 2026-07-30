import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../data/source/remote/dto/response/reminder_care_tasks_response_dto.dart';

abstract class ReminderCareTaskRepository {
  Future<Either<Failure, void>> createReminderCareTask({
    required String patientId,
    required DateTime startDate,
    required DateTime endDate,
    required String title,
    required String description,
    required int frequency,
  });

  Future<Either<Failure, void>> deleteReminderCareTask({
    required String reminderId,
  });

  Future<Either<Failure, void>> markAsDoneReminderCareTask({
    required String reminderId,
  });

  Future<Either<Failure, ReminderCareTasksResponseDto>> getReminderCareTask({
    String? patientId,
  });
}
