import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/transaction_otp_response_dto.dart';
import 'package:soul_doctor/app/domain/model/transaction_otp.dart';
import 'package:soul_doctor/app/domain/repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  Future<Either<Failure, TransactionOtp>> execute({
    required String email,
  }) async {
    var response = await _authRepository.register(email: email);

    return response.fold(
      (failure) {
        return Left(failure);
      },
      (success) {
        return Right(success.toTransactionOtp());
      },
    );
  }
}
