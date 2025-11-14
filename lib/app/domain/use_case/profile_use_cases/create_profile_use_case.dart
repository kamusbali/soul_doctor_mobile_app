import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/domain/model/education.dart';
import 'package:soul_doctor/app/domain/model/gender.dart';
import 'package:soul_doctor/app/domain/model/marital.dart';
import 'package:soul_doctor/app/domain/model/religion.dart';
import 'package:soul_doctor/app/domain/repository/profile_repository.dart';

import '../../model/role.dart';

class CreateProfileUseCase {
  ProfileRepository _profileRepository;

  CreateProfileUseCase(this._profileRepository);

  Future<Either<Failure, bool>> execute({
    required Role role,
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
    var response = await _profileRepository.createProfile(
      role: role,
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

    return response.fold(
      (failure) {
        return Left(failure);
      },
      (success) {
        return Right(success);
      },
    );
  }
}
