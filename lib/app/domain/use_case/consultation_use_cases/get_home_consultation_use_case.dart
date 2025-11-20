import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/consultation_response_dto.dart';
import 'package:soul_doctor/app/domain/model/consultation.dart';
import 'package:soul_doctor/app/domain/model/role.dart';
import 'package:soul_doctor/app/domain/repository/consultation_repository.dart';

class GetHomeConsultationUseCase {
  final ConsultationRepository _consultationRepository;

  GetHomeConsultationUseCase(this._consultationRepository);

  Future<Either<Failure, List<Consultation>>> execute({
    required Role role,
    String? patientId,
  }) async {
    List<Consultation> consultation = [];

    for (var status in role.status) {
      var response = await _consultationRepository.getConsultation(
        state: status,
        pp: 1,
        visit: null,
        patientId: patientId,
      );

      response.fold(
        (failure) {
          return Left(failure);
        },
        (success) {
          consultation.addAll(success.toConsultationPaging().data);
        },
      );
    }

    return Right(consultation);
  }
}
