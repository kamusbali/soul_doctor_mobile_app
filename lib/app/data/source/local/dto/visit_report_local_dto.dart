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

  // NEW FIELDS
  int? sleepHour;
  int? afterSleepConditionId;
  int? medicineConditionId;
  int? communicationId;
  int? selfCareId;
  bool? doingCeremony;
  String? ceremonyName;
  int? pemuputUpacaraId;

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

    // NEW FIELDS
    this.sleepHour,
    this.afterSleepConditionId,
    this.medicineConditionId,
    this.communicationId,
    this.selfCareId,
    this.doingCeremony,
    this.ceremonyName,
    this.pemuputUpacaraId,
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

        // NEW FIELDS
        sleepHour: json["sleep_hour"],
        afterSleepConditionId: json["after_sleep_condition_id"],
        medicineConditionId: json["medicine_condition_id"],
        communicationId: json["communication_id"],
        selfCareId: json["self_care_id"],
        doingCeremony: json["doing_ceremony"],
        ceremonyName: json["ceremony_name"],
        pemuputUpacaraId: json["pemuput_upacara_id"],
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
        "images": images == null
            ? []
            : List<Uint8List>.from(images!.map((x) => x)),

        // NEW FIELDS
        "sleep_hour": sleepHour,
        "after_sleep_condition_id": afterSleepConditionId,
        "medicine_condition_id": medicineConditionId,
        "communication_id": communicationId,
        "self_care_id": selfCareId,
        "doing_ceremony": doingCeremony,
        "ceremony_name": ceremonyName,
        "pemuput_upacara_id": pemuputUpacaraId,
      };
}