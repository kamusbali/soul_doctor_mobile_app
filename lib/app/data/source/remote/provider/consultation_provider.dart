import 'package:dio/dio.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/compact_consultation_detail_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/consultation_detail_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/consultation_response_dto.dart';
import 'package:soul_doctor/app/helpers/date_time_utils.dart';

import '../../../../core/network/api_url.dart';
import '../../../../core/network/dio_client.dart';
import '../dto/common/response_wrapper.dart';

class ConsultationProvider {
  final Dio _dio = DioClient.instance;

  Future<ResponseWrapper<ConsultationResponseDto?>> getConsultation({
    required int state,
    bool? medication,
    bool? therapy,
    bool? visit,
    int? age,
    bool? firstConsultation,
    String? patientId,
    String? q,
    int? p,
    int? pp,
  }) async {
    try {
      var response = await _dio.get(
        ApiUrl.consultation,
        queryParameters: {
          "state": state,
          "medication": medication,
          "therapy": therapy,
          "visit": visit,
          "age": age,
          "first_consultation": firstConsultation,
          "patient_id": patientId,
          "p": p,
          "pp": pp,
          "q": q,
        },
      );
      var result = ResponseWrapper<ConsultationResponseDto>.fromJson(
        response.data,
        (json) =>
            ConsultationResponseDto.fromJson(json as Map<String, dynamic>),
      );
      return result;
    } catch (e) {
      rethrow;
    }
    // return ResponseWrapper.fromJson(
    //   {
    //     "status": 200,
    //     "message": "success get consultations",
    //     "data": {
    //       "consultations": [
    //         {
    //           "id": "189d6f51-b790-47ee-a247-38d7ad752ad0",
    //           "name": "Made Cenik",
    //           "description": "Perasaan hampa dan kehilangan semangat",
    //           "address": "Jalan Cenik",
    //           "state": 1,
    //           "visit_date": null,
    //           "medication_summary": {
    //             "medication": true,
    //             "therapy": true,
    //             "visit": false,
    //           },
    //           "patient_summary": {
    //             "is_continuation": true,
    //             "is_first_visit": false,
    //             "age": 27,
    //             "gender": true,
    //             "is_visit_rejected": true,
    //             "has_caregiver": true,
    //           },
    //         },
    //         {
    //           "id": "189d6f51-b790-47ee-a247-38d7ad752a21",
    //           "name": "Kadek Bagus",
    //           "description": "Kecemasan berlebihan",
    //           "address": "Jalan Cenik",
    //           "state": 1,
    //           "visit_date": null,
    //           "medication_summary": {
    //             "medication": true,
    //             "therapy": true,
    //             "visit": false,
    //           },
    //           "patient_summary": {
    //             "is_continuation": false,
    //             "is_first_visit": null,
    //             "age": 27,
    //             "gender": true,
    //             "is_visit_rejected": true,
    //             "has_caregiver": true,
    //           },
    //         },
    //       ],
    //       "pagination": {"current_page": 1, "total_page": 1},
    //     },
    //   },
    //   (json) => ConsultationResponseDto.fromJson(json as Map<String, dynamic>),
    // );
  }

  Future<ResponseWrapper<ConsultationDetailResponseDto>> getConsultationDetail(
    String id,
  ) async {
    try {
      var response = await _dio.get(
        "${ApiUrl.consultation}/$id",
        queryParameters: {"compact": false},
      );
      var result = ResponseWrapper<ConsultationDetailResponseDto>.fromJson(
        response.data,
        (json) => ConsultationDetailResponseDto.fromJson(
          json as Map<String, dynamic>,
        ),
      );
      return result;
    } catch (e) {
      rethrow;
    }
    // return ResponseWrapper.fromJson(
    //   {
    //     "status": 200,
    //     "message": "success get consultations",
    //     "data": {
    //       "state": 1,
    //       "patient": {
    //         "fullname": "John Doe",
    //         "nickname": "John",
    //         "birthday": "2025-09-01",
    //         "gender": "Laki-laki",
    //         "marital_status_id": 2,
    //         "last_education_id": 3,
    //         "job": "Swasta",
    //         "religion_id": 1,
    //         "phone": "+6285123456789",
    //         "address": "Br. Kebilbil, Desa Belalang, Kediri, Tabanan, Bali",
    //       },
    //       "caregiver": {
    //         "fullname": "John Doe",
    //         "nickname": "John",
    //         "birthday": "2025-09-01",
    //         "gender": "Laki-laki",
    //         "marital_status_id": 2,
    //         "last_education_id": 3,
    //         "job": "Swasta",
    //         "religion_id": 1,
    //         "phone": "+6285123456789",
    //         "address": "Br. Kebilbil, Desa Belalang, Kediri, Tabanan, Bali",
    //       },
    //       "consultation_request": {
    //         "symptom":
    //             "Cemas berlebihan, kesulitan tidur, stres karena pekerjaan",
    //         "start_date": "2025-09-01",
    //         "image": "https://example.com/image.jpg",
    //       },
    //       "visitor": null,
    //       "visit_note": "Jangan nakal selama visit",
    //       "recent_visitors": [
    //         {"date": "2025-03-14", "name": "I Komang"},
    //         {"date": "2025-03-14", "name": "I Made"},
    //       ],
    //       "visitor_rejections": [
    //         {"time": "2025-03-14", "name": "I Made Cenik", "reason": "Banjir"},
    //         {
    //           "time": "2025-03-14T09:15:30Z",
    //           "name": "I Wayan",
    //           "reason": "malas",
    //         },
    //       ],
    //       "visit_result": {
    //         "observation": "Pasien lebih banyak diam, terkadang senyum sendiri",
    //         "images": [
    //           "https://example.com/image1.jpg",
    //           "https://example.com/image2.jpg",
    //         ],
    //       },
    //       "doctor_diagnosis": {
    //         "diagnosis": "Depresi",
    //         "medication":
    //             "- Clonazepam 0.5 mg (1 x sehari sampai habis) - Amoxicillin 500 mg (3 x sehari sampai habis)\n",
    //         "therapy":
    //             "- Istirahat cukup, kurangi penggunaan gadget sebelum tidur - Olahraga ringan dan rutin\n",
    //         "note": "Jangan malas",
    //       },
    //     },
    //   },
    //   (json) =>
    //       ConsultationDetailResponseDto.fromJson(json as Map<String, dynamic>),
    // );
  }

  Future<ResponseWrapper<CompactConsultationDetailResponseDto>>
  getCompactConsultationDetail(String id) async {
    try {
      var response = await _dio.get(
        "${ApiUrl.consultation}/$id",
        queryParameters: {"compact": true},
      );
      var result =
          ResponseWrapper<CompactConsultationDetailResponseDto>.fromJson(
            response.data,
            (json) => CompactConsultationDetailResponseDto.fromJson(
              json as Map<String, dynamic>,
            ),
          );
      return result;
    } catch (e) {
      rethrow;
    }
    // return ResponseWrapper.fromJson(
    //   {
    //     "status": 200,
    //     "message": "success get consultations",
    //     "data": {
    //       "symptom":
    //           "Cemas berlebihan, kesulitan tidur, stres karena pekerjaan",
    //       "start_date": "2025-09-25",
    //       "symptom_image": "https://example.com/image.jpg",
    //       "observation": "Pasien lebih banyak diam, terkadang senyum sendiri",
    //       "diagnosis": "Depresi",
    //       "medication":
    //           "- Clonazepam 0.5 mg (1 x sehari sampai habis) - Amoxicillin 500 mg (3 x sehari sampai habis)\n",
    //       "therapy":
    //           "- Istirahat cukup, kurangi penggunaan gadget sebelum tidur - Olahraga ringan dan rutin\n",
    //       "visitor": "Putu Widyantara",
    //       "visit_images": [
    //         "https://example.com/image1.jpg",
    //         "https://example.com/image2.jpg",
    //       ],
    //     },
    //   },
    //   (json) => CompactConsultationDetailResponseDto.fromJson(
    //     json as Map<String, dynamic>,
    //   ),
    // );
  }

  Future<ResponseWrapper> createRequestConsultation({
    required String patientId,
    required String symptom,
    required DateTime startDate,
    MultipartFile? image,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "patient_id": patientId,
        "symptom": symptom,
        "start_date": DateTimeUtils.onlyDate(startDate),
        "image": image,
      });

      var response = await _dio.post(ApiUrl.consultation, data: formData);
      var result = ResponseWrapper.fromJson(response.data, (json) => null);
      return result;
    } catch (e) {
      rethrow;
    }
    // return ResponseWrapper.fromJson({
    //   "status": 201,
    //   "message": "cosultation created successfully",
    //   "data": null,
    // }, (json) => null);
  }
}
