import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/domain/repository/auth_repository.dart';

class UpdatePinUseCase {
  final AuthRepository _authRepository;

  UpdatePinUseCase(this._authRepository);

  Future<Either<Failure, bool>> execute({
    required String oldPin,
    required String newPin,
    required String newPinRepeat,
  }) async {
    var response = await _authRepository.changePin(
      oldPin: oldPin,
      newPin: newPin,
      newPinRepeat: newPinRepeat,
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
