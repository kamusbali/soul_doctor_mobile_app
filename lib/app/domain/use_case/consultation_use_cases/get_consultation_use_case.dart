import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/common/pagination.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/consultation_response_dto.dart';
import 'package:soul_doctor/app/domain/model/consultation.dart';
import 'package:soul_doctor/app/domain/model/consultation_status.dart';

import '../../repository/consultation_repository.dart';

class GetConsultationUseCase {
  final ConsultationRepository _consultationRepository;

  GetConsultationUseCase(this._consultationRepository);

  Future<Either<Failure, Pagination<List<Consultation>>>> execute({
    required ConsultationStatus state,
    bool? medication,
    bool? therapy,
    bool? visit,
    int? age,
    bool? firstConsultation,
    String? patientId,
    String? q,
    int? p,
    int? pp,
  }) async {
    var response = await _consultationRepository.getConsultation(
      state: state,
      medication: medication,
      visit: visit,
      age: age,
      firstConsultation: firstConsultation,
      patientId: patientId,
      q: q,
      p: p,
      pp: pp,
    );

    return response.fold(
      (failure) {
        return Left(failure);
      },
      (success) {
        return Right(success.toConsultationPaging());
      },
    );
  }
}
