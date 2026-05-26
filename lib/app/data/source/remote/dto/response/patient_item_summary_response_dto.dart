// To parse this JSON data, do
//
//     final patientItemSummaryResponseDto = patientItemSummaryResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/domain/model/patient_item_summary.dart';

import '../../../local/dto/patient_summary_local_dto.dart';

PatientItemSummaryResponseDto patientItemSummaryResponseDtoFromJson(
  String str,
) => PatientItemSummaryResponseDto.fromJson(json.decode(str));

String patientItemSummaryResponseDtoToJson(
  PatientItemSummaryResponseDto data,
) => json.encode(data.toJson());

class PatientItemSummaryResponseDto {
  int? age;
  bool? gender;
  bool? hasCaregiver;

  PatientItemSummaryResponseDto({this.age, this.gender, this.hasCaregiver});

  factory PatientItemSummaryResponseDto.fromJson(Map<String, dynamic> json) =>
      PatientItemSummaryResponseDto(
        age: json["age"],
        gender: json["gender"],
        hasCaregiver: json["has_caregiver"],
      );

  Map<String, dynamic> toJson() => {
    "age": age,
    "gender": gender,
    "has_caregiver": hasCaregiver,
  };
}

extension PatientItemSummaryResponseDtoConversion
    on PatientItemSummaryResponseDto {
  PatientItemSummary toPatientItemSummary() {
    return PatientItemSummary(
      age: age!,
      gender: gender!,
      hasCaregiver: hasCaregiver!,
    );
  }

  PatientSummaryLocalDto toPatientSummaryLocalDto() {
    return PatientSummaryLocalDto(
      age: age,
      gender: gender,
      hasCaregiver: hasCaregiver,
    );
  }
}
