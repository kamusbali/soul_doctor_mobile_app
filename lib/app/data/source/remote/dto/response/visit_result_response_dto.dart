// To parse this JSON data, do
//
//     final visitorResultResponseDto = visitorResultResponseDtoFromJson(jsonString);
import 'dart:convert';

import 'package:soul_doctor/app/common/constant/default.dart';
import 'package:soul_doctor/app/domain/model/after_sleep_condition.dart';
import 'package:soul_doctor/app/domain/model/visit_result.dart';
import 'package:soul_doctor/app/domain/model/visit_result_status.dart';

import '../../../../../domain/model/comunication.dart';
import '../../../../../domain/model/medicine_condition.dart';
import '../../../../../domain/model/pemuput_upacara.dart';
import '../../../../../domain/model/self_care.dart';

VisitResultResponseDto visitorResultResponseDtoFromJson(String str) =>
    VisitResultResponseDto.fromJson(json.decode(str));

String visitorResultResponseDtoToJson(VisitResultResponseDto data) =>
    json.encode(data.toJson());

class VisitResultResponseDto {
  String? observation;
  bool? sideEffect;
  int? resultStatusId;
  List<String>? images;

  // NEW FIELDS
  int? sleepHour;
  int? afterSleepConditionId;
  int? medicineConditionId;
  int? communicationId;
  int? selfCareId;
  bool? doingCeremony;
  String? ceremonyName;
  int? pemuputUpacaraId;

  VisitResultResponseDto({
    this.observation,
    this.sideEffect,
    this.resultStatusId,
    this.images,

    // NEW
    this.sleepHour,
    this.afterSleepConditionId,
    this.medicineConditionId,
    this.communicationId,
    this.selfCareId,
    this.doingCeremony,
    this.ceremonyName,
    this.pemuputUpacaraId,
  });

  factory VisitResultResponseDto.fromJson(Map<String, dynamic> json) =>
      VisitResultResponseDto(
        observation: json["observation"],
        sideEffect: json["side_effect"],
        resultStatusId: json["result_status_id"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),

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
    "observation": observation,
    "side_effect": sideEffect,
    "result_status_id": resultStatusId,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),

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

extension VisitResultReponseDtoConversion on VisitResultResponseDto {
  VisitResult toVisitResult() {
    return VisitResult(
      observation: observation!,
      sideEffect: sideEffect,
      resultStatus: VisitResultStatus.getVisitResultById(
        resultStatusId ?? Default.defaultInt,
      ),
      images: images ?? [],

      // NEW FIELDS (pastikan model VisitResult sudah support ini)
      sleepHour: sleepHour,
      afterSleepCondition: AfterSleepCondition.getAfterSleepConditionFromId(
        afterSleepConditionId ?? Default.defaultInt,
      ),
      medicineCondition: MedicineCondition.getMedicineConditionFromId(
        medicineConditionId ?? Default.defaultInt,
      ),
      communication: Comunication.getComunicationFromId(
        communicationId ?? Default.defaultInt,
      ),
      selfCare: SelfCare.getSelfCareFromId(selfCareId ?? Default.defaultInt),
      doingCeremony: doingCeremony,
      ceremonyName: ceremonyName,
      pemuputUpacara: PemuputUpacara.getPamuputUpacaraFromId(
        pemuputUpacaraId ?? Default.defaultInt,
      ),
    );
  }
}
