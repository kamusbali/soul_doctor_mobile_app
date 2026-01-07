// To parse this JSON data, do
//
//     final visitReportLocalDto = visitReportLocalDtoFromJson(jsonString);

import 'dart:convert';
import 'dart:typed_data';

VisitReportLocalDto visitReportLocalDtoFromJson(String str) =>
    VisitReportLocalDto.fromJson(json.decode(str));

String visitReportLocalDtoToJson(VisitReportLocalDto data) =>
    json.encode(data.toJson());

class VisitReportLocalDto {
  String? visitId;
  String? observation;
  bool? sideEffect;
  int? resultStatusId;
  String? cooperation;
  String? mainDisease;
  String? autoanamnesis;
  String? diseaseHistory;
  String? familyHistory;
  String? heteroanamnesis;
  String? medicationHistory;
  String? psychiatricStatus;
  List<Uint8List>? images;

  VisitReportLocalDto({
    this.visitId,
    this.observation,
    this.sideEffect,
    this.resultStatusId,
    this.cooperation,
    this.mainDisease,
    this.autoanamnesis,
    this.diseaseHistory,
    this.familyHistory,
    this.heteroanamnesis,
    this.medicationHistory,
    this.psychiatricStatus,
    this.images,
  });

  factory VisitReportLocalDto.fromJson(Map<String, dynamic> json) =>
      VisitReportLocalDto(
        visitId: json["visit_id"],
        observation: json["observation"],
        sideEffect: json["side_effect"],
        resultStatusId: json["result_status_id"],
        cooperation: json["cooperation"],
        mainDisease: json["main_disease"],
        autoanamnesis: json["autoanamnesis"],
        diseaseHistory: json["disease_history"],
        familyHistory: json["family_history"],
        heteroanamnesis: json["heteroanamnesis"],
        medicationHistory: json["medication_history"],
        psychiatricStatus: json["psychiatric_status"],
        images: json["images"] == null
            ? []
            : List<Uint8List>.from(json["images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
    "visit_id": visitId,
    "observation": observation,
    "side_effect": sideEffect,
    "result_status_id": resultStatusId,
    "cooperation": cooperation,
    "main_disease": mainDisease,
    "autoanamnesis": autoanamnesis,
    "disease_history": diseaseHistory,
    "family_history": familyHistory,
    "heteroanamnesis": heteroanamnesis,
    "medication_history": medicationHistory,
    "psychiatric_status": psychiatricStatus,
    "images": images == null ? [] : List<Uint8List>.from(images!.map((x) => x)),
  };
}
