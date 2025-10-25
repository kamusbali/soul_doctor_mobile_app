import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/compact_user_response_dto.dart';
import 'package:soul_doctor/app/domain/model/compact_user.dart';
import 'package:soul_doctor/app/domain/repository/profile_repository.dart';

class GetCompactProfileUseCase {
  final ProfileRepository _profileRepository;

  GetCompactProfileUseCase(this._profileRepository);

  Future<Either<Failure, CompactUser?>> execute() async {
    var response = await _profileRepository.getCompactProfile();

    return response.fold(
      (failure) {
        return Left(failure);
      },
      (success) {
        return Right(success?.toCompactUser());
      },
    );
  }
}
