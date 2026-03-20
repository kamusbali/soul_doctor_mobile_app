import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/domain/model/visit_result_status.dart';
import 'package:soul_doctor/app/domain/repository/visit_repository.dart';

import '../../model/after_sleep_condition.dart';
import '../../model/comunication.dart';
import '../../model/medicine_condition.dart';
import '../../model/pemuput_upacara.dart';
import '../../model/self_care.dart';

class ReportVolunteerUseCase {
  final VisitRepository _visitRepository;

  ReportVolunteerUseCase(this._visitRepository);

  Future<Either<Failure, bool>> execute({
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
  }) async {
    var response = await _visitRepository.reportVolunteer(
      visitId: visitId,
      observation: observation,
      cooperation: cooperation,
      mainDisease: mainDisease,
      autoanamnesis: autoanamnesis,
      diseaseHistory: diseaseHistory,
      familyHistory: familyHistory,
      heteroanamnesis: heteroanamnesis,
      medicationHistory: medicationHistory,
      psychiatricStatus: psychiatricStatus,
      images: images,
      sideEffect: sideEffect,
      resultStatusId: resultStatusId,
      sleepHour: sleepHour,
      afterSleepCondition: afterSleepCondition,
      medicineCondition: medicineCondition,
      communication: communication,
      selfCare: selfCare,
      doingCeremony: doingCeremony,
      ceremonyName: ceremonyName,
      pemuputUpcara: pemuputUpcara,
    );

    return response;
  }
}
