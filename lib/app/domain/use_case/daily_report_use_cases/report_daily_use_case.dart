import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soul_doctor/app/domain/repository/daily_report_repository.dart';

import '../../../core/error/failure.dart' show Failure;
import '../../model/after_sleep_condition.dart';
import '../../model/comunication.dart';
import '../../model/medicine_condition.dart';
import '../../model/pemuput_upacara.dart';
import '../../model/self_care.dart';
import '../../model/visit_result_status.dart';

class ReportDailyUseCase {
  final DailyReportRepository _dailyReportRepository;

  ReportDailyUseCase(this._dailyReportRepository);

  Future<Either<Failure, bool>> execute({
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
  }) async {
    var response = await _dailyReportRepository.reportDaily(
      patientId: patientId,
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
