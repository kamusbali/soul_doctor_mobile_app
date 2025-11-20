import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/domain/repository/diagnosis_repository.dart';

class CreateDiagnosisUseCase {
  final DiagnosisRepository _diagnosisRepository;

  CreateDiagnosisUseCase(this._diagnosisRepository);

  Future<Either<Failure, bool>> execute({
    required String consultationId,
    required String diagnosis,
    String? medication,
    String? therapy,
    String? note,
  }) async {
    var response = await _diagnosisRepository.createDiagnosis(
      consultationId: consultationId,
      diagnosis: diagnosis,
      medication: medication,
      therapy: therapy,
      note: note,
    );

    return response;
  }
}
