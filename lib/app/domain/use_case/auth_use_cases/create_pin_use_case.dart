import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/domain/repository/auth_repository.dart';

class CreatePinUseCase {
  final AuthRepository _authRepository;

  CreatePinUseCase(this._authRepository);

  Future<Either<Failure, bool>> execute({
    required String transactionId,
    required String pin,
    required String pinRepeat,
  }) async {
    var response = await _authRepository.createPin(
      transactionId: transactionId,
      pin: pin,
      pinRepeat: pinRepeat,
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
