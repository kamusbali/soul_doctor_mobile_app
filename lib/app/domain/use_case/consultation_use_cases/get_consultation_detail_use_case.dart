import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/consultation_detail_response_dto.dart';
import 'package:soul_doctor/app/domain/model/consultation_detail.dart';
import 'package:soul_doctor/app/domain/repository/consultation_repository.dart';

class GetConsultationDetailUseCase {
  final ConsultationRepository _consultationRepository;

  GetConsultationDetailUseCase(this._consultationRepository);

  Future<Either<Failure, ConsultationDetail>> execute(String id) async {
    var response = await _consultationRepository.getConsultationDetail(id);

    return response.fold(
      (failure) {
        return Left(failure);
      },
      (success) {
        return Right(success.toConsultationDetail());
      },
    );
  }
}
