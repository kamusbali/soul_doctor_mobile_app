import 'package:soul_doctor/app/domain/model/visit_result_status.dart';

import 'after_sleep_condition.dart';
import 'comunication.dart';
import 'medicine_condition.dart';
import 'pemuput_upacara.dart';
import 'self_care.dart';

class VisitResult {
  String observation;
  bool? sideEffect;
  VisitResultStatus? resultStatus;
  List<String> images;
  int? sleepHour;
  AfterSleepCondition? afterSleepCondition;
  MedicineCondition? medicineCondition;
  Comunication? communication;
  SelfCare? selfCare;
  bool? doingCeremony;
  String? ceremonyName;
  PemuputUpacara? pemuputUpacara;

  VisitResult({
    required this.observation,
    required this.images,
    this.sideEffect,
    this.resultStatus,
    this.sleepHour,
    this.afterSleepCondition,
    this.medicineCondition,
    this.communication,
    this.selfCare,
    this.doingCeremony,
    this.ceremonyName,
    this.pemuputUpacara,
  });
}
