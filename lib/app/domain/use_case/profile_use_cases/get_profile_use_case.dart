import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/profile_response_dto.dart';
import 'package:soul_doctor/app/domain/model/profile.dart';

import '../../../core/error/failure.dart';
import '../../repository/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository _profileRepository;

  GetProfileUseCase(this._profileRepository);

  Future<Either<Failure, Profile>> execute() async {
    var response = await _profileRepository.getProfile();

    return response.fold(
      (failure) {
        return Left(failure);
      },
      (success) {
        return Right(success.toProfile());
      },
    );
  }
}
