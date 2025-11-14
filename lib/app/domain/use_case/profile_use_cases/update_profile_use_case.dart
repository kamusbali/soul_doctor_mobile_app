import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/domain/repository/profile_repository.dart';

import '../../model/education.dart';
import '../../model/gender.dart';
import '../../model/marital.dart';
import '../../model/religion.dart';
import '../../model/role.dart';

class UpdateProfileUseCase {
  final ProfileRepository _profileRepository;

  UpdateProfileUseCase(this._profileRepository);

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
    var response = await _profileRepository.updateProfile(
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
