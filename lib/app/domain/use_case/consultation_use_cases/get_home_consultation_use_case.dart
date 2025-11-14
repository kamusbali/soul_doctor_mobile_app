import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/consultation_response_dto.dart';
import 'package:soul_doctor/app/domain/model/consultation.dart';
import 'package:soul_doctor/app/domain/model/consultation_status.dart';
import 'package:soul_doctor/app/domain/repository/consultation_repository.dart';

class GetHomeConsultationUseCase {
  final ConsultationRepository _consultationRepository;

  GetHomeConsultationUseCase(this._consultationRepository);

  Future<Either<Failure, List<Consultation>>> execute({
    required ConsultationStatus state,
    String? patientId,
  }) async {
    var response = await _consultationRepository.getConsultation(
      state: state,
      pp: 5,
      visit: null,
      patientId: patientId,
    );

    return response.fold(
      (failure) {
        return Left(failure);
      },
      (success) {
        return Right(success.toConsultationPaging().data);
      },
    );
  }
}
