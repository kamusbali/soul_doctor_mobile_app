import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/diagnosis_request.dart';
import 'package:soul_doctor/app/data/source/remote/provider/diagnosis_provider.dart';
import 'package:soul_doctor/app/domain/repository/diagnosis_repository.dart';

import '../../core/error/error_type.dart';
import '../source/remote/dto/common/response_wrapper.dart';

class DiagnosisRepositoryImpl implements DiagnosisRepository {
  final DiagnosisProvider _diagnosisProvider;

  DiagnosisRepositoryImpl(this._diagnosisProvider);

  @override
  Future<Either<Failure, bool>> createDiagnosis({
    required String consultationId,
    required String diagnosis,
    required String medication,
    required String therapy,
    required String note,
  }) async {
    try {
      await _diagnosisProvider.createDiagnosis(
        DiagnosisRequest(
          consultationId: consultationId,
          diagnosis: diagnosis,
          medication: medication,
          therapy: therapy,
          note: note,
        ),
      );
      return Right(true);
    } catch (e) {
      if (e is DioException) {
        try {
          var networkErrorMessage = ResponseWrapper.fromJson(
            (e).response?.data,
            (_) {},
          );
          if (networkErrorMessage.status == 401) {
            return Left(
              Failure(
                networkErrorMessage.message.toString(),
                errorType: ErrorType.sessionExpired,
              ),
            );
          }
          return Left(
            Failure(networkErrorMessage.message ?? "Unexpected Error Occured"),
          );
        } catch (e) {
          return Left(Failure("Error dalam melakukan konversi"));
        }
      }
      return Left(Failure(e.toString()));
    }
  }
}
