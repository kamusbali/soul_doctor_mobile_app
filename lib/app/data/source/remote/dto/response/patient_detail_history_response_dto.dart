// To parse this JSON data, do
//
//     final patientDetailHistoryResponseDto = patientDetailHistoryResponseDtoFromJson(jsonString);

import 'dart:convert';

PatientDetailHistoryResponseDto patientDetailHistoryResponseDtoFromJson(
  String str,
) => PatientDetailHistoryResponseDto.fromJson(json.decode(str));

String patientDetailHistoryResponseDtoToJson(
  PatientDetailHistoryResponseDto data,
) => json.encode(data.toJson());

class PatientDetailHistoryResponseDto {
  String? cooperation;
  String? mainDisease;
  String? autoanamnesis;
  String? diseaseHistory;
  String? familyHistory;
  String? heteroanamnesis;
  String? medicationHistory;
  String? psychiatricStatus;

  PatientDetailHistoryResponseDto({
    this.cooperation,
    this.mainDisease,
    this.autoanamnesis,
    this.diseaseHistory,
    this.familyHistory,
    this.heteroanamnesis,
    this.medicationHistory,
    this.psychiatricStatus,
  });

  factory PatientDetailHistoryResponseDto.fromJson(Map<String, dynamic> json) =>
      PatientDetailHistoryResponseDto(
        cooperation: json["cooperation"],
        mainDisease: json["main_disease"],
        autoanamnesis: json["autoanamnesis"],
        diseaseHistory: json["disease_history"],
        familyHistory: json["family_history"],
        heteroanamnesis: json["heteroanamnesis"],
        medicationHistory: json["medication_history"],
        psychiatricStatus: json["psychiatric_status"],
      );

  Map<String, dynamic> toJson() => {
    "cooperation": cooperation,
    "main_disease": mainDisease,
    "autoanamnesis": autoanamnesis,
    "disease_history": diseaseHistory,
    "family_history": familyHistory,
    "heteroanamnesis": heteroanamnesis,
    "medication_history": medicationHistory,
    "psychiatric_status": psychiatricStatus,
  };
}
