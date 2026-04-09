import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/error/failure.dart';
import '../model/after_sleep_condition.dart';
import '../model/comunication.dart';
import '../model/medicine_condition.dart';
import '../model/pemuput_upacara.dart';
import '../model/self_care.dart';
import '../model/visit_result_status.dart';

abstract class DailyReportRepository {
  Future<Either<Failure, bool>> reportDaily({
    required String patientId,
    required String observation,
    required bool sideEffect,
    required VisitResultStatus resultStatusId,
    String? cooperation,
    String? mainDisease,
    String? autoanamnesis,
    String? diseaseHistory,
    String? familyHistory,
    String? heteroanamnesis,
    String? medicationHistory,
    String? psychiatricStatus,
    List<XFile>? images,
    required int sleepHour,
    required AfterSleepCondition afterSleepCondition,
    required MedicineCondition medicineCondition,
    required Comunication communication,
    required SelfCare selfCare,
    required bool doingCeremony,
    String? ceremonyName,
    PemuputUpacara? pemuputUpcara,
  });
}
