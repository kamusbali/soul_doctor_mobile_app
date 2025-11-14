import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/domain/repository/auth_repository.dart';

class VerifyOtpUseCase {
  final AuthRepository _authRepository;

  VerifyOtpUseCase(this._authRepository);

  Future<Either<Failure, bool>> execute({
    required String transactionId,
    required String otp,
  }) async {
    var response = await _authRepository.verifyOtp(
      transactionId: transactionId,
      otp: otp,
    );

    return response.fold(
      (failure) {
        return Left(failure);
      },
      (success) async {
        return Right(true);
      },
    );
  }
}
