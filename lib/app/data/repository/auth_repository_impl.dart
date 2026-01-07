import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/core/infrastructure/auth/claims_token_service.dart';
import 'package:soul_doctor/app/data/source/local/provider/token_provider.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/change_pin_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/create_pin_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/login_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/otp_phone_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/verify_otp_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/auth_status_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/transaction_otp_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/provider/auth_provider.dart';
import 'package:soul_doctor/app/domain/model/session_data.dart';
import 'package:soul_doctor/app/domain/repository/auth_repository.dart';

import '../../core/error/error_type.dart';
import '../source/remote/dto/common/response_wrapper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthProvider _authProvider;
  final TokenProvider _tokenManager = TokenProvider.instance;
  final ClaimsTokenService _claimsTokenService = ClaimsTokenService.instance;

  AuthRepositoryImpl(this._authProvider);

  @override
  Future<Either<Failure, bool>> changePin({
    required String oldPin,
    required String newPin,
    required String newPinRepeat,
  }) async {
    try {
      await _authProvider.changePin(
        ChangePinRequest(
          oldPin: oldPin,
          newPin: newPin,
          newPinRepeat: newPinRepeat,
        ),
      );
      return Right(true);
    } catch (e) {
      if (e is DioException) {
        try {
          var networkErrorMessage = ResponseWrapper.fromJson(
            (e).response?.data,
            (_) {},
          );
          if (networkErrorMessage.status == 401) {
            return Left(
              Failure(
                networkErrorMessage.message.toString(),
                errorType: ErrorType.sessionExpired,
              ),
            );
          }
          return Left(
            Failure(networkErrorMessage.message ?? "Unexpected Error Occured"),
          );
        } catch (e) {
          return Left(Failure("Error dalam melakukan konversi"));
        }
      }
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> createPin({
    required String transactionId,
    required String pin,
    required String pinRepeat,
  }) async {
    try {
      await _authProvider.createPin(
        CreatePinRequest(
          transactionId: transactionId,
          pin: pin,
          pinRepeat: pinRepeat,
        ),
      );
      return Right(true);
    } catch (e) {
      if (e is DioException) {
        try {
          var networkErrorMessage = ResponseWrapper.fromJson(
            (e).response?.data,
            (_) {},
          );
          if (networkErrorMessage.status == 401) {
            return Left(
              Failure(
                networkErrorMessage.message.toString(),
                errorType: ErrorType.sessionExpired,
              ),
            );
          }
          return Left(
            Failure(networkErrorMessage.message ?? "Unexpected Error Occured"),
          );
        } catch (e) {
          return Left(Failure("Error dalam melakukan konversi"));
        }
      }
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TransactionOtpResponseDto>> forgetPassword({
    required String email,
  }) async {
    try {
      var response = await _authProvider.forgetPassword(
        OtpEmailRequest(email: email),
      );
      if (response.data == null) return Left(Failure("Data kosong"));
      return Right(response.data!);
    } catch (e) {
      if (e is DioException) {
        try {
          var networkErrorMessage = ResponseWrapper.fromJson(
            (e).response?.data,
            (_) {},
          );
          if (networkErrorMessage.status == 401) {
            return Left(
              Failure(
                networkErrorMessage.message.toString(),
                errorType: ErrorType.sessionExpired,
              ),
            );
          }
          return Left(
            Failure(networkErrorMessage.message ?? "Unexpected Error Occured"),
          );
        } catch (e) {
          return Left(Failure("Error dalam melakukan konversi"));
        }
      }
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthStatusResponse>> login({
    required String email,
    required String pin,
  }) async {
    try {
      var response = await _authProvider.login(
        LoginRequest(email: email, pin: pin),
      );
      if (response.data == null) return Left(Failure("Data kosong"));

      return Right(response.data!);
    } catch (e) {
      if (e is DioException) {
        try {
          var networkErrorMessage = ResponseWrapper.fromJson(
            (e).response?.data,
            (_) {},
          );
          if (networkErrorMessage.status == 401) {
            return Left(
              Failure(
                networkErrorMessage.message.toString(),
                errorType: ErrorType.sessionExpired,
              ),
            );
          }
          return Left(
            Failure(networkErrorMessage.message ?? "Unexpected Error Occured"),
          );
        } catch (e) {
          return Left(Failure("Error dalam melakukan konversi"));
        }
      }
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TransactionOtpResponseDto>> register({
    required String email,
  }) async {
    try {
      var response = await _authProvider.register(
        OtpEmailRequest(email: email),
      );
      if (response.data == null) return Left(Failure("Data kosong"));
      return Right(response.data!);
    } catch (e) {
      if (e is DioException) {
        try {
          var networkErrorMessage = ResponseWrapper.fromJson(
            (e).response?.data,
            (_) {},
          );
          if (networkErrorMessage.status == 401) {
            return Left(
              Failure(
                networkErrorMessage.message.toString(),
                errorType: ErrorType.sessionExpired,
              ),
            );
          }
          return Left(
            Failure(networkErrorMessage.message ?? "Unexpected Error Occured"),
          );
        } catch (e) {
          return Left(Failure("Error dalam melakukan konversi"));
        }
      }
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> verifyOtp({
    required String transactionId,
    required String otp,
  }) async {
    try {
      await _authProvider.verifyOtp(
        VerifyOtpRequest(transactionId: transactionId, otp: otp),
      );
      return Right(true);
    } catch (e) {
      if (e is DioException) {
        try {
          var networkErrorMessage = ResponseWrapper.fromJson(
            (e).response?.data,
            (_) {},
          );
          if (networkErrorMessage.status == 401) {
            return Left(
              Failure(
                networkErrorMessage.message.toString(),
                errorType: ErrorType.sessionExpired,
              ),
            );
          }
          return Left(
            Failure(networkErrorMessage.message ?? "Unexpected Error Occured"),
          );
        } catch (e) {
          return Left(Failure("Error dalam melakukan konversi"));
        }
      }
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<SessionData?> getSessionData() async {
    return await _claimsTokenService.getSessionData();
    // return SessionData(
    //   id: "",
    //   fullname: "Anak Agung Ngurah Putra Tole Armstrong",
    //   nickname: "Agung",
    //   role: Role.doctor,
    //   iat: DateTime.now(),
    // );
  }

  @override
  Future<void> logout() async {
    await _claimsTokenService.clearSessionData();
    await _tokenManager.clearAll();
  }

  @override
  Future<bool> getSessionStatus() async {
    var accessToken = await _tokenManager.getAccessToken();
    var refreshToken = await _tokenManager.getRefreshToken();
    // return true;
    return accessToken != null && refreshToken != null;
  }

  Future<void> onSaveToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _tokenManager.saveAccessToken(accessToken);
    await _tokenManager.saveRefreshToken(refreshToken);
  }
}
