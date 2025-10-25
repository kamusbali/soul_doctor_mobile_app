// To parse this JSON data, do
//
//     final doctorDiagnosisResponseDto = doctorDiagnosisResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/domain/model/doctor_diagnosis.dart';

DoctorDiagnosisResponseDto doctorDiagnosisResponseDtoFromJson(String str) =>
    DoctorDiagnosisResponseDto.fromJson(json.decode(str));

String doctorDiagnosisResponseDtoToJson(DoctorDiagnosisResponseDto data) =>
    json.encode(data.toJson());

class DoctorDiagnosisResponseDto {
  String? diagnosis;
  String? medication;
  String? therapy;
  String? note;

  DoctorDiagnosisResponseDto({
    this.diagnosis,
    this.medication,
    this.therapy,
    this.note,
  });

  factory DoctorDiagnosisResponseDto.fromJson(Map<String, dynamic> json) =>
      DoctorDiagnosisResponseDto(
        diagnosis: json["diagnosis"],
        medication: json["medication"],
        therapy: json["therapy"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
    "diagnosis": diagnosis,
    "medication": medication,
    "therapy": therapy,
    "note": note,
  };
}

extension DoctorDiagnosisResponseDtoConversion on DoctorDiagnosisResponseDto {
  DoctorDiagnosis toDoctorDiagnosis() {
    return DoctorDiagnosis(
      diagnosis: diagnosis!,
      medication: medication,
      therapy: therapy,
      note: note,
    );
  }
}
