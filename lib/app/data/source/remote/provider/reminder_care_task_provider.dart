import 'package:dio/dio.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/reminder_care_tasks_response_dto.dart';

import '../../../../core/network/api_url.dart';
import '../../../../core/network/dio_client.dart';
import '../dto/common/response_wrapper.dart';
import '../dto/request/reminder_care_task_request.dart';

class ReminderCareTaskProvider {
  final Dio _dio = DioClient.instance;

  Future<ResponseWrapper<ReminderCareTasksResponseDto>> getReminderCareTasks({
    String? patientId,
  }) async {
    try {
      var response = await _dio.get(
        ApiUrl.reminders,
        queryParameters: {"patient_id": patientId},
      );
      var result = ResponseWrapper.fromJson(
        response.data,
        (json) =>
            ReminderCareTasksResponseDto.fromJson(json as Map<String, dynamic>),
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseWrapper> createReminderCareTask({
    required ReminderCareTaskRequest reminderCareTaskRequest,
  }) async {
    try {
      var response = await _dio.post(
        ApiUrl.reminders,
        data: reminderCareTaskRequest.toJson(),
      );
      var result = ResponseWrapper.fromJson(response.data, (json) => null);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseWrapper> markAsDoneReminderCareTask({
    required String reminderDetailID,
  }) async {
    try {
      var response = await _dio.patch("${ApiUrl.reminders}/$reminderDetailID");
      var result = ResponseWrapper.fromJson(response.data, (json) => null);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseWrapper> deleteReminderCareTask({
    required String reminderDetailID,
  }) async {
    try {
      var response = await _dio.delete("${ApiUrl.reminders}/$reminderDetailID");
      var result = ResponseWrapper.fromJson(response.data, (json) => null);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
