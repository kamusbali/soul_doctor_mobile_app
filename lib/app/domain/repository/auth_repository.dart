import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/auth_status_response_dto.dart';
import 'package:soul_doctor/app/domain/model/session_data.dart';

import '../../data/source/remote/dto/response/transaction_otp_response_dto.dart';

abstract class AuthRepository {
  Future<Either<Failure, TransactionOtpResponseDto>> register({
    required String phone,
  });

  Future<Either<Failure, bool>> verifyOtp({
    required String transactionId,
    required String otp,
  });

  Future<Either<Failure, bool>> createPin({
    required String transactionId,
    required String pin,
    required String pinRepeat,
  });

  Future<Either<Failure, AuthStatusResponse>> login({
    required String phone,
    required String pin,
  });

  Future<Either<Failure, bool>> changePin({
    required String oldPin,
    required String newPin,
    required String newPinRepeat,
  });

  Future<Either<Failure, TransactionOtpResponseDto>> forgetPassword({
    required String phone,
  });

  Future<SessionData?> getSessionData();

  Future<void> logout();

  Future<bool> getSessionStatus();

  Future<void> onSaveToken({
    required String accessToken,
    required String refreshToken,
  });
}
