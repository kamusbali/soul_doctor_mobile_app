import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/domain/repository/patient_repository.dart';

import '../../model/education.dart';
import '../../model/gender.dart';
import '../../model/marital.dart';
import '../../model/religion.dart';

class CreatePatientUseCase {
  final PatientRepository _patientRepository;

  CreatePatientUseCase(this._patientRepository);

  Future<Either<Failure, bool>> execute({
    required String fullname,
    required String nickname,
    required String phone,
    required String email,
    required DateTime birthday,
    required Gender gender,
    required Marital maritalStatusId,
    required Education lastEducationId,
    required String job,
    required Religion religionId,
    required String address,
  }) async {
    var response = await _patientRepository.createPatientOnCaregiver(
      fullname: fullname,
      nickname: nickname,
      phone: phone,
      email: email,
      birthday: birthday,
      gender: gender,
      maritalStatusId: maritalStatusId,
      lastEducationId: lastEducationId,
      job: job,
      religionId: religionId,
      address: address,
    );

    return response;
  }
}
