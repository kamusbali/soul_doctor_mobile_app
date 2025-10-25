import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/patient_response_dto.dart';
import 'package:soul_doctor/app/domain/model/patient.dart';
import 'package:soul_doctor/app/domain/repository/patient_repository.dart';

class GetPatientUseCase {
  final PatientRepository _patientRepository;

  GetPatientUseCase(this._patientRepository);

  Future<Either<Failure, List<Patient>>> execute({String? q}) async {
    var response = await _patientRepository.getPatient(q: q);

    return response.fold(
      (failure) {
        return Left(failure);
      },
      (success) {
        return Right(success.toPatient());
      },
    );
  }
}
