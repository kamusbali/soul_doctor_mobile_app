// To parse this JSON data, do
//
//     final diagnosisRequest = diagnosisRequestFromJson(jsonString);

import 'dart:convert';

DiagnosisRequest diagnosisRequestFromJson(String str) =>
    DiagnosisRequest.fromJson(json.decode(str));

String diagnosisRequestToJson(DiagnosisRequest data) =>
    json.encode(data.toJson());

class DiagnosisRequest {
  String? consultationId;
  String? diagnosis;
  String? medication;
  String? therapy;
  String? note;

  DiagnosisRequest({
    this.consultationId,
    this.diagnosis,
    this.medication,
    this.therapy,
    this.note,
  });

  factory DiagnosisRequest.fromJson(Map<String, dynamic> json) =>
      DiagnosisRequest(
        consultationId: json["consultation_id"],
        diagnosis: json["diagnosis"],
        medication: json["medication"],
        therapy: json["therapy"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
    "consultation_id": consultationId,
    "diagnosis": diagnosis,
    "medication": medication,
    "therapy": therapy,
    "note": note,
  };
}
