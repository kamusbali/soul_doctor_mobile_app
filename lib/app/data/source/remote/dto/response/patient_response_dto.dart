// To parse this JSON data, do
//
//     final patientResponseDto = patientResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/data/source/remote/dto/response/pagination_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/patient_item_response_dto.dart';
import 'package:soul_doctor/app/domain/model/patient.dart';

PatientResponseDto patientResponseDtoFromJson(String str) =>
    PatientResponseDto.fromJson(json.decode(str));

String patientResponseDtoToJson(PatientResponseDto data) =>
    json.encode(data.toJson());

class PatientResponseDto {
  List<PatientItemResponseDto>? patients;
  PaginationResponseDto? pagination;

  PatientResponseDto({this.patients, this.pagination});

  factory PatientResponseDto.fromJson(Map<String, dynamic> json) =>
      PatientResponseDto(
        patients: json["patients"] == null
            ? []
            : List<PatientItemResponseDto>.from(
                json["patients"]!.map(
                  (x) => PatientItemResponseDto.fromJson(x),
                ),
              ),
        pagination: json["pagination"] == null
            ? null
            : PaginationResponseDto.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
    "patients": patients == null
        ? []
        : List<dynamic>.from(patients!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}

extension PatientResponseDtoConversion on PatientResponseDto {
  List<Patient> toPatient() {
    return patients?.map((e) => e.toPatient()).toList() ?? [];
  }
}
