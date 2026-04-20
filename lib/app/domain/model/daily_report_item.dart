import 'package:soul_doctor/app/domain/model/after_sleep_condition.dart';
import 'package:soul_doctor/app/domain/model/comunication.dart';
import 'package:soul_doctor/app/domain/model/medicine_condition.dart';
import 'package:soul_doctor/app/domain/model/pemuput_upacara.dart';
import 'package:soul_doctor/app/domain/model/self_care.dart';
import 'package:soul_doctor/app/domain/model/visit_result_status.dart';

class DailyReportItem {
  String observation;
  bool sideEffect;
  VisitResultStatus resultStatus;
  int sleepHour;
  AfterSleepCondition afterSleepCondition;
  MedicineCondition medicineCondition;
  Comunication communication;
  SelfCare selfCare;
  bool? doingCeremony;
  String? ceremonyName;
  PemuputUpacara pemuputUpacaraId;
  List<String>? images;
  DateTime reportDate;
  String reporter;

  DailyReportItem({
    required this.observation,
    required this.sideEffect,
    required this.resultStatus,
    required this.sleepHour,
    required this.afterSleepCondition,
    required this.medicineCondition,
    required this.communication,
    required this.selfCare,
    this.doingCeremony,
    this.ceremonyName,
    required this.pemuputUpacaraId,
    this.images,
    required this.reportDate,
    required this.reporter,
  });
}
