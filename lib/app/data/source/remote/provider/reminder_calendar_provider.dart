import 'package:dio/dio.dart';
import 'package:soul_doctor/app/data/source/remote/dto/common/response_wrapper.dart';

import '../../../../core/network/api_url.dart';
import '../../../../core/network/dio_client.dart';

class ReminderCalendarProvider {
  final Dio _dio = DioClient.instance;

  Future<ResponseWrapper> addDataToServer({
    required String json,
    required DateTime time,
  }) async {
    try {
      var response = await _dio.post(
        ApiUrl.reminders,
        data: {
          "reminder": json,
          "date":
              "${time.year}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}", // "2025-09-01"
        },
      );

      var result = ResponseWrapper.fromJson(response.data, (json) => null);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
