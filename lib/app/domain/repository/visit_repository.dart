import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soul_doctor/app/core/error/failure.dart';

import '../model/after_sleep_condition.dart';
import '../model/comunication.dart';
import '../model/medicine_condition.dart';
import '../model/pemuput_upacara.dart';
import '../model/self_care.dart';
import '../model/visit_result_status.dart';

abstract class VisitRepository {
  Future<Either<Failure, bool>> assignVolunteer({
    required String consultationId,
    required String volunteerId,
    required String note,
  });

  Future<Either<Failure, bool>> reportVolunteer({
    required String visitId,
    required String observation,
    bool? sideEffect,
    VisitResultStatus? resultStatusId,
    String? cooperation,
    String? mainDisease,
    String? autoanamnesis,
    String? diseaseHistory,
    String? familyHistory,
    String? heteroanamnesis,
    String? medicationHistory,
    String? psychiatricStatus,
    List<XFile>? images,
    int? sleepHour,
    AfterSleepCondition? afterSleepCondition,
    MedicineCondition? medicineCondition,
    Comunication? communication,
    SelfCare? selfCare,
    bool? doingCeremony,
    String? ceremonyName,
    PemuputUpacara? pemuputUpcara,
  });

  Future<Either<Failure, bool>> rejectVolunteerVisit({
    required String visitId,
    required String reason,
  });

  Future<Either<Failure, bool>> acceptVolunteerVisit({required String visitId});
}
