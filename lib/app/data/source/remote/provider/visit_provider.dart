import 'package:dio/dio.dart';
import 'package:soul_doctor/app/core/network/dio_client.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/accept_visit_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/assign_visit_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/reject_visit_request.dart';

import '../../../../core/network/api_url.dart';
import '../dto/common/response_wrapper.dart';

class VisitProvider {
  final Dio _dio = DioClient.instance;

  Future<ResponseWrapper> assignVolunteerVisit(
    AssignVisitRequest visitRequest,
  ) async {
    try {
      var response = await _dio.post(
        ApiUrl.visits,
        data: visitRequest.toJson(),
      );
      var result = ResponseWrapper.fromJson(response.data, (json) => null);
      return result;
    } catch (e) {
      rethrow;
    }
    // return ResponseWrapper.fromJson({
    //   "status": 201,
    //   "message": "profile created successfully",
    //   "data": null,
    // }, (json) => null);
  }

  Future<ResponseWrapper> reportVisit({
    required String visitId,
    required String observation,
    String? cooperation,
    String? mainDisease,
    String? autoanamnesis,
    String? diseaseHistory,
    String? familyHistory,
    String? heteroanamnesis,
    String? medicationHistory,
    String? psychiatricStatus,
    List<MultipartFile>? images,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "visit_id": visitId,
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
      });

      var response = await _dio.post(ApiUrl.visitsReport, data: formData);
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

  Future<ResponseWrapper> rejectVolunteerVisit(
    RejectVisitRequest rejectVisitRequest,
  ) async {
    try {
      var response = await _dio.post(
        ApiUrl.visitsReject,
        data: rejectVisitRequest.toJson(),
      );
      var result = ResponseWrapper.fromJson(response.data, (json) => null);
      return result;
    } catch (e) {
      rethrow;
    }
    // return ResponseWrapper.fromJson({
    //   "status": 200,
    //   "message": "visit request rejected successfully",
    //   "data": null,
    // }, (json) => null);
  }

  Future<ResponseWrapper> acceptVolunteerVisit(
    AcceptVisitRequestDto acceptVisitRequest,
  ) async {
    try {
      var response = await _dio.post(
        ApiUrl.visitsAccept,
        data: acceptVisitRequest.toJson(),
      );
      var result = ResponseWrapper.fromJson(response.data, (json) => null);
      return result;
    } catch (e) {
      rethrow;
    }
    // return ResponseWrapper.fromJson({
    //   "status": 200,
    //   "message": "visit request accepted successfully",
    //   "data": null,
    // }, (json) => null);
  }
}
