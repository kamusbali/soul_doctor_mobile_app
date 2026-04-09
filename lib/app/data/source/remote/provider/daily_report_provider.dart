import 'package:dio/dio.dart';

import '../../../../core/network/api_url.dart';
import '../../../../core/network/dio_client.dart';
import '../dto/common/response_wrapper.dart';

class DailyReportProvider {
  final Dio _dio = DioClient.instance;

  Future<ResponseWrapper> reportDaily({
    required String patientId,
    required String observation,
    required bool sideEffect,
    required int resultStatusId,
    String? cooperation,
    String? mainDisease,
    String? autoanamnesis,
    String? diseaseHistory,
    String? familyHistory,
    String? heteroanamnesis,
    String? medicationHistory,
    String? psychiatricStatus,
    List<MultipartFile>? images,
    required int sleepHour,
    required int afterSleepConditionId,
    required int medicineConditionId,
    required int communicationId,
    required int selfCareId,
    required bool doingCeremony,
    String? ceremonyName,
    int? pemuputUpacaraId,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "patient_id": patientId,
        "observation": observation,
        "cooperation": cooperation,
        "main_disease": mainDisease,
        "autoanamnesis": autoanamnesis,
        "disease_history": diseaseHistory,
        "family_history": familyHistory,
        "heteroanamnesis": heteroanamnesis,
        "medication_history": medicationHistory,
        "psychiatric_status": psychiatricStatus,
        "images": images,
        "result_status_id": resultStatusId ?? 2,
        "side_effect": sideEffect,
        "sleep_hour": sleepHour,
        "after_sleep_condition_id": afterSleepConditionId ?? 3,
        "medicine_condition_id": medicineConditionId ?? 1,
        "communication_id": communicationId ?? 1,
        "self_care_id": selfCareId ?? 1,
        "doing_ceremony": doingCeremony,
        "ceremony_name": ceremonyName,
        "pemuput_upacara_id": pemuputUpacaraId ?? 1,
      });

      print("Ini Data : ${formData.fields}");

      var response = await _dio.post(ApiUrl.dailyReport, data: formData);
      var result = ResponseWrapper.fromJson(response.data, (json) => null);
      return result;
    } catch (e) {
      rethrow;
    }
    // return ResponseWrapper.fromJson({
    //   "status": 201,
    //   "message": "visit report created successfully",
    //   "data": null,
    // }, (json) => null);
  }
}
