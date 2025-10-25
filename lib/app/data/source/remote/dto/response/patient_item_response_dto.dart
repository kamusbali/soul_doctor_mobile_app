// To parse this JSON data, do
//
//     final patientItemResponseDto = patientItemResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/data/source/remote/dto/response/patient_item_summary_response_dto.dart';
import 'package:soul_doctor/app/domain/model/patient.dart';

PatientItemResponseDto patientItemResponseDtoFromJson(String str) =>
    PatientItemResponseDto.fromJson(json.decode(str));

String patientItemResponseDtoToJson(PatientItemResponseDto data) =>
    json.encode(data.toJson());

class PatientItemResponseDto {
  String? id;
  String? name;
  PatientItemSummaryResponseDto? summary;

  PatientItemResponseDto({this.id, this.name, this.summary});

  factory PatientItemResponseDto.fromJson(Map<String, dynamic> json) =>
      PatientItemResponseDto(
        id: json["id"],
        name: json["name"],
        summary: json["summary"] == null
            ? null
            : PatientItemSummaryResponseDto.fromJson(json["summary"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "summary": summary?.toJson(),
  };
}

extension PatientItemResponseDtoConversion on PatientItemResponseDto {
  Patient toPatient() {
    return Patient(
      id: id!,
      name: name!,
      summary: summary!.toPatientItemSummary(),
    );
  }
}
