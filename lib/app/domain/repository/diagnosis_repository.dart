import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';

abstract class DiagnosisRepository {
  Future<Either<Failure, bool>> createDiagnosis({
    required String consultationId,
    required String diagnosis,
    required String medication,
    required String therapy,
    required String note,
  });
}
