import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:soul_doctor/app/core/error/failure.dart';

import 'package:soul_doctor/app/data/source/remote/dto/response/reminder_care_tasks_response_dto.dart';

import '../../core/error/error_type.dart';
import '../../domain/repository/reminder_care_task_repository.dart';
import '../source/remote/dto/common/response_wrapper.dart';
import '../source/remote/dto/request/reminder_care_task_request.dart';
import '../source/remote/provider/reminder_care_task_provider.dart';

class ReminderCareTaskRepositoryImpl implements ReminderCareTaskRepository {
  final ReminderCareTaskProvider _reminderCareTaskProvider;

  ReminderCareTaskRepositoryImpl(this._reminderCareTaskProvider);

  @override
  Future<Either<Failure, void>> createReminderCareTask({
    required String patientId,
    required DateTime startDate,
    required DateTime endDate,
    required String title,
    required String description,
    required int frequency,
  }) async {
    try {
      await _reminderCareTaskProvider.createReminderCareTask(
        reminderCareTaskRequest: ReminderCareTaskRequest(
          patientId: patientId,
          startDate: startDate,
          endDate: endDate,
          title: title,
          description: description,
          frequencyPerDay: frequency,
        ),
      );

      return Right(null);
    } catch (e) {
      if (e is DioException) {
        var networkErrorMessage = ResponseWrapper.fromJson(
          (e).response?.data,
          (_) {},
        );
        if (networkErrorMessage.status == 401) {
          return Left(
            Failure(
              networkErrorMessage.message.toString(),
              errorType: ErrorType.sessionExpired,
            ),
          );
        }
        return Left(
          Failure(networkErrorMessage.message ?? "Unexpected Error Occured"),
        );
      }
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteReminderCareTask({
    required String reminderId,
  }) async {
    try {
      await _reminderCareTaskProvider.deleteReminderCareTask(
        reminderDetailID: reminderId,
      );

      return Right(null);
    } catch (e) {
      if (e is DioException) {
        var networkErrorMessage = ResponseWrapper.fromJson(
          e.response?.data,
          (_) {},
        );
        if (networkErrorMessage.status == 401) {
          return Left(
            Failure(
              networkErrorMessage.message.toString(),
              errorType: ErrorType.sessionExpired,
            ),
          );
        }
        return Left(
          Failure(networkErrorMessage.message ?? "Unexpected Error Occured"),
        );
      }
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReminderCareTasksResponseDto>> getReminderCareTask({
    String? patientId,
  }) async {
    try {
      var response = await _reminderCareTaskProvider.getReminderCareTasks(
        patientId: patientId,
      );

      if (response.data == null) {
        return Left(Failure("Tidak ada data reminder"));
      }

      return Right(response.data!);
    } catch (e) {
      if (e is DioException) {
        var networkErrorMessage = ResponseWrapper.fromJson(
          e.response?.data,
          (_) {},
        );
        if (networkErrorMessage.status == 401) {
          return Left(
            Failure(
              networkErrorMessage.message.toString(),
              errorType: ErrorType.sessionExpired,
            ),
          );
        }
        return Left(
          Failure(networkErrorMessage.message ?? "Unexpected Error Occured"),
        );
      }
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> markAsDoneReminderCareTask({
    required String reminderId,
  }) async {
    try {
      await _reminderCareTaskProvider.markAsDoneReminderCareTask(
        reminderDetailID: reminderId,
      );
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        var networkErrorMessage = ResponseWrapper.fromJson(
          e.response?.data,
          (_) {},
        );
        if (networkErrorMessage.status == 401) {
          return Left(
            Failure(
              networkErrorMessage.message.toString(),
              errorType: ErrorType.sessionExpired,
            ),
          );
        }
        return Left(
          Failure(networkErrorMessage.message ?? "Unexpected Error Occured"),
        );
      }
      return Left(Failure(e.toString()));
    }
  }
}
