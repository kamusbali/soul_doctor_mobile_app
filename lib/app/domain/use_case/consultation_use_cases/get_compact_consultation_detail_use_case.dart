import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/compact_consultation_detail_response_dto.dart';
import 'package:soul_doctor/app/domain/model/compact_consultation_detail.dart';
import 'package:soul_doctor/app/domain/repository/consultation_repository.dart';

class GetCompactConsultationDetailUseCase {
  final ConsultationRepository _consultationRepository;

  GetCompactConsultationDetailUseCase(this._consultationRepository);

  Future<Either<Failure, CompactConsultationDetail>> execute(String id) async {
    var response = await _consultationRepository.getCompactConsultationDetail(
      id,
    );

    return response.fold(
      (failure) {
        return Left(failure);
      },
      (success) {
        return Right(success.toCompactConsultationDetail());
      },
    );
  }
}
