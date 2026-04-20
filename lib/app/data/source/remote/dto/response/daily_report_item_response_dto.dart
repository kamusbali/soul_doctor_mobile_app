// To parse this JSON data, do
//
//     final dailyReportResponseDto = dailyReportResponseDtoFromJson(jsonString);

import '../../../../../domain/model/after_sleep_condition.dart';
import '../../../../../domain/model/comunication.dart';
import '../../../../../domain/model/daily_report_item.dart';
import '../../../../../domain/model/medicine_condition.dart';
import '../../../../../domain/model/pemuput_upacara.dart';
import '../../../../../domain/model/self_care.dart';
import '../../../../../domain/model/visit_result_status.dart';

class DailyReportItemResponseDto {
  String? observation;
  bool? sideEffect;
  int? resultStatusId;
  int? sleepHour;
  int? afterSleepConditionId;
  int? medicineConditionId;
  int? communicationId;
  int? selfCareId;
  bool? doingCeremony;
  String? ceremonyName;
  int? pemuputUpacaraId;
  List<String>? images;
  DateTime? reportDate;
  String? reporter;

  DailyReportItemResponseDto({
    this.observation,
    this.sideEffect,
    this.resultStatusId,
    this.sleepHour,
    this.afterSleepConditionId,
    this.medicineConditionId,
    this.communicationId,
    this.selfCareId,
    this.doingCeremony,
    this.ceremonyName,
    this.pemuputUpacaraId,
    this.images,
    this.reportDate,
    this.reporter,
  });

  factory DailyReportItemResponseDto.fromJson(Map<String, dynamic> json) =>
      DailyReportItemResponseDto(
        observation: json["observation"],
        sideEffect: json["side_effect"],
        resultStatusId: json["result_status_id"],
        sleepHour: json["sleep_hour"],
        afterSleepConditionId: json["after_sleep_condition_id"],
        medicineConditionId: json["medicine_condition_id"],
        communicationId: json["communication_id"],
        selfCareId: json["self_care_id"],
        doingCeremony: json["doing_ceremony"],
        ceremonyName: json["ceremony_name"],
        pemuputUpacaraId: json["pemuput_upacara_id"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        reportDate: json["report_date"] == null
            ? null
            : DateTime.parse(json["report_date"]),
        reporter: json["reporter"],
      );

  Map<String, dynamic> toJson() => {
    "observation": observation,
    "side_effect": sideEffect,
    "result_status_id": resultStatusId,
    "sleep_hour": sleepHour,
    "after_sleep_condition_id": afterSleepConditionId,
    "medicine_condition_id": medicineConditionId,
    "communication_id": communicationId,
    "self_care_id": selfCareId,
    "doing_ceremony": doingCeremony,
    "ceremony_name": ceremonyName,
    "pemuput_upacara_id": pemuputUpacaraId,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "report_date": reportDate?.toIso8601String(),
    "reporter": reporter,
  };
}

extension DailyReportItemResponseDtoConversion on DailyReportItemResponseDto {
  DailyReportItem toDailyReportItem() {
    return DailyReportItem(
      observation: observation ?? "",
      sideEffect: sideEffect ?? false,
      resultStatus: VisitResultStatus.values.firstWhere(
        (e) => e.id == resultStatusId,
      ),
      sleepHour: sleepHour ?? 0,
      afterSleepCondition: AfterSleepCondition.values.firstWhere(
        (e) => e.id == afterSleepConditionId,
      ),
      medicineCondition: MedicineCondition.values.firstWhere(
        (e) => e.id == medicineConditionId,
      ),
      communication: Comunication.values.firstWhere(
        (e) => e.id == communicationId,
      ),
      selfCare: SelfCare.values.firstWhere((e) => e.id == selfCareId),
      doingCeremony: doingCeremony,
      ceremonyName: ceremonyName,
      pemuputUpacaraId: PemuputUpacara.values.firstWhere(
        (e) => e.id == pemuputUpacaraId,
      ),
      images: images,
      reportDate: reportDate ?? DateTime.now(),
      reporter: reporter ?? "",
    );
  }
}
