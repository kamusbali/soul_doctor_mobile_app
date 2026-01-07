import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/domain/model/visit_result_status.dart';
import 'package:soul_doctor/app/domain/repository/visit_repository.dart';

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
    );

    return response;
  }
}
