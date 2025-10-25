// To parse this JSON data, do
//
//     final patientDetailResponseDto = patientDetailResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/data/source/remote/dto/response/compact_information_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/compact_consultation_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/patient_detail_history_response_dto.dart';

PatientDetailResponseDto patientDetailResponseDtoFromJson(String str) =>
    PatientDetailResponseDto.fromJson(json.decode(str));

String patientDetailResponseDtoToJson(PatientDetailResponseDto data) =>
    json.encode(data.toJson());

class PatientDetailResponseDto {
  CompactInformationResponseDto? patient;
  CompactInformationResponseDto? caregiver;
  PatientDetailHistoryResponseDto? patientHistory;
  List<CompactConsultationResponseDto>? consultations;

  PatientDetailResponseDto({
    this.patient,
    this.caregiver,
    this.patientHistory,
    this.consultations,
  });

  factory PatientDetailResponseDto.fromJson(Map<String, dynamic> json) =>
      PatientDetailResponseDto(
        patient: json["patient"] == null
            ? null
            : CompactInformationResponseDto.fromJson(json["patient"]),
        caregiver: json["caregiver"] == null
            ? null
            : CompactInformationResponseDto.fromJson(json["caregiver"]),
        patientHistory: json["patient_history"] == null
            ? null
            : PatientDetailHistoryResponseDto.fromJson(json["patient_history"]),
        consultations: json["consultations"] == null
            ? []
            : List<CompactConsultationResponseDto>.from(
                json["consultations"]!.map(
                  (x) => CompactConsultationResponseDto.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
    "patient": patient?.toJson(),
    "caregiver": caregiver?.toJson(),
    "patient_history": patientHistory?.toJson(),
    "consultations": consultations == null
        ? []
        : List<dynamic>.from(consultations!.map((x) => x.toJson())),
  };
}
