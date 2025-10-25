// To parse this JSON data, do
//
//     final patientSummaryResponseDto = patientSummaryResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/common/constant/default.dart';
import 'package:soul_doctor/app/domain/model/patient_summary.dart';

PatientSummaryResponseDto patientSummaryResponseDtoFromJson(String str) =>
    PatientSummaryResponseDto.fromJson(json.decode(str));

String patientSummaryResponseDtoToJson(PatientSummaryResponseDto data) =>
    json.encode(data.toJson());

class PatientSummaryResponseDto {
  bool? isContinuation;
  bool? isFirstVisit;
  int? age;
  bool? gender;
  bool? isVisitRejected;
  bool? hasCaregiver;

  PatientSummaryResponseDto({
    this.isContinuation,
    this.isFirstVisit,
    this.age,
    this.gender,
    this.isVisitRejected,
    this.hasCaregiver,
  });

  factory PatientSummaryResponseDto.fromJson(Map<String, dynamic> json) =>
      PatientSummaryResponseDto(
        isContinuation: json["is_continuation"],
        isFirstVisit: json["is_first_visit"],
        age: json["age"],
        gender: json["gender"],
        isVisitRejected: json["is_visit_rejected"],
        hasCaregiver: json["has_caregiver"],
      );

  Map<String, dynamic> toJson() => {
    "is_continuation": isContinuation,
    "is_first_visit": isFirstVisit,
    "age": age,
    "gender": gender,
    "is_visit_rejected": isVisitRejected,
    "has_caregiver": hasCaregiver,
  };
}

extension PatientSummaryResponseDtoConversion on PatientSummaryResponseDto {
  PatientSummary toPatientSummary() {
    return PatientSummary(
      isContinuation: isContinuation ?? Default.defaultBool,
      isFirstVisit: isFirstVisit ?? Default.defaultBool,
      age: age ?? Default.defaultInt,
      gender: gender ?? Default.defaultBool,
      isVisitRejected: isVisitRejected ?? Default.defaultBool,
      hasCaregiver: hasCaregiver ?? Default.defaultBool,
    );
  }
}
