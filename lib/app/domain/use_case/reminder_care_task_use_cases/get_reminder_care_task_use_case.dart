import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/reminder_care_tasks_response_dto.dart';

import '../../../core/error/failure.dart';
import '../../model/reminder_care_task.dart';
import '../../repository/reminder_care_task_repository.dart';

class GetReminderCareTaskUseCase {
  final ReminderCareTaskRepository _reminderCareTaskRepository;

  GetReminderCareTaskUseCase(this._reminderCareTaskRepository);

  Future<Either<Failure, List<ReminderCareTask>>> execute({
    String? patientId,
  }) async {
    var response = await _reminderCareTaskRepository.getReminderCareTask(
      patientId: patientId,
    );
    return response.fold((failure) => Left(failure), (success) {
      return Right(success.toListReminderCareTask());
    });
  }
}
