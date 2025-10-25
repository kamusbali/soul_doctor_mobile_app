// To parse this JSON data, do
//
//     final consultationDetailResponseDto = consultationDetailResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/data/source/remote/dto/response/consultation_request_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/current_visit_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/doctor_diagnosis_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/profile_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/recent_visitor_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/visit_result_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/visitor_rejection_response_dto.dart';
import 'package:soul_doctor/app/domain/model/consultation_detail.dart';
import 'package:soul_doctor/app/domain/model/consultation_status.dart';

ConsultationDetailResponseDto consultationDetailResponseDtoFromJson(
  String str,
) => ConsultationDetailResponseDto.fromJson(json.decode(str));

String consultationDetailResponseDtoToJson(
  ConsultationDetailResponseDto data,
) => json.encode(data.toJson());

class ConsultationDetailResponseDto {
  int? state;
  ProfileResponseDto? patient;
  ProfileResponseDto? caregiver;
  ConsultationRequestResponseDto? consultationRequest;
  CurrentVisitResponseDto? currentVisit;
  List<RecentVisitorResponseDto>? recentVisitors;
  List<VisitorRejectionResponseDto>? visitorRejections;
  VisitResultResponseDto? visitResult;
  DoctorDiagnosisResponseDto? doctorDiagnosis;

  ConsultationDetailResponseDto({
    this.state,
    this.patient,
    this.caregiver,
    this.consultationRequest,
    this.currentVisit,
    this.recentVisitors,
    this.visitorRejections,
    this.visitResult,
    this.doctorDiagnosis,
  });

  factory ConsultationDetailResponseDto.fromJson(Map<String, dynamic> json) =>
      ConsultationDetailResponseDto(
        state: json["state"],
        patient: json["patient"] == null
            ? null
            : ProfileResponseDto.fromJson(json["patient"]),
        caregiver: json["caregiver"] == null
            ? null
            : ProfileResponseDto.fromJson(json["caregiver"]),
        consultationRequest: json["consultation_request"] == null
            ? null
            : ConsultationRequestResponseDto.fromJson(
                json["consultation_request"],
              ),
        currentVisit: json["current_visit"] == null
            ? null
            : CurrentVisitResponseDto.fromJson(json["current_visit"]),
        recentVisitors: json["recent_visitors"] == null
            ? []
            : List<RecentVisitorResponseDto>.from(
                json["recent_visitors"]!.map(
                  (x) => RecentVisitorResponseDto.fromJson(x),
                ),
              ),
        visitorRejections: json["visitor_rejections"] == null
            ? []
            : List<VisitorRejectionResponseDto>.from(
                json["visitor_rejections"]!.map(
                  (x) => VisitorRejectionResponseDto.fromJson(x),
                ),
              ),
        visitResult: json["visit_result"] == null
            ? null
            : VisitResultResponseDto.fromJson(json["visit_result"]),
        doctorDiagnosis: json["doctor_diagnosis"] == null
            ? null
            : DoctorDiagnosisResponseDto.fromJson(json["doctor_diagnosis"]),
      );

  Map<String, dynamic> toJson() => {
    "state": state,
    "patient": patient?.toJson(),
    "caregiver": caregiver?.toJson(),
    "consultation_request": consultationRequest?.toJson(),
    "current_visit": currentVisit?.toJson(),
    "recent_visitors": recentVisitors == null
        ? []
        : List<dynamic>.from(recentVisitors!.map((x) => x.toJson())),
    "visitor_rejections": visitorRejections == null
        ? []
        : List<dynamic>.from(visitorRejections!.map((x) => x.toJson())),
    "visit_result": visitResult?.toJson(),
    "doctor_diagnosis": doctorDiagnosis?.toJson(),
  };
}

extension ConsultationDetailResponseDtoConversion
    on ConsultationDetailResponseDto {
  ConsultationDetail toConsultationDetail() {
    return ConsultationDetail(
      state: ConsultationStatus.getConsultationStatusById(state!)!,
      patient: patient!.toProfile(),
      caregiver: caregiver?.toProfile(),
      currentVisit: currentVisit?.toCurrentVisit(),
      consultationRequest: consultationRequest!.toConsultationRequestData(),
      recentVisitors:
          recentVisitors?.map((e) => e.toRecentVisitor()).toList() ?? [],
      visitorRejections:
          visitorRejections?.map((e) => e.toVisitorRejection()).toList() ?? [],
      visitResult: visitResult?.toVisitResult(),
      doctorDiagnosis: doctorDiagnosis?.toDoctorDiagnosis(),
    );
  }
}
