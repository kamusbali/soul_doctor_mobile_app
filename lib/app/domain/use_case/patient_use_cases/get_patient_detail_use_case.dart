import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/patient_detail_response_dto.dart';
import 'package:soul_doctor/app/domain/model/patient_detail.dart';
import 'package:soul_doctor/app/domain/repository/patient_repository.dart';

class GetPatientDetailUseCase {
  final PatientRepository _patientRepository;

  GetPatientDetailUseCase(this._patientRepository);

  Future<Either<Failure, PatientDetail>> execute(String id) async {
    var response = await _patientRepository.getPatientDetail(id);

    return response.fold(
      (failure) {
        return Left(failure);
      },
      (success) {
        return Right(success.toPatientDetail());
      },
    );
  }
}
