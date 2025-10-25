import 'package:dio/dio.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/accept_visit_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/assign_visit_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/reject_visit_request.dart';

import '../dto/common/response_wrapper.dart';

class VisitProvider {
  Future<ResponseWrapper> assignVolunteerVisit(
    AssignVisitRequest visitRequest,
  ) async {
    return ResponseWrapper.fromJson({
      "status": 201,
      "message": "profile created successfully",
      "data": null,
    }, (json) => null);
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
    return ResponseWrapper.fromJson({
      "status": 201,
      "message": "visit report created successfully",
      "data": null,
    }, (json) => null);
  }

  Future<ResponseWrapper> rejectVolunteerVisit(
    RejectVisitRequest rejectVisitRequest,
  ) async {
    return ResponseWrapper.fromJson({
      "status": 200,
      "message": "visit request rejected successfully",
      "data": null,
    }, (json) => null);
  }

  Future<ResponseWrapper> acceptVolunteerVisit(
    AcceptVisitRequestDto acceptVisitRequest,
  ) async {
    return ResponseWrapper.fromJson({
      "status": 200,
      "message": "visit request accepted successfully",
      "data": null,
    }, (json) => null);
  }
}
