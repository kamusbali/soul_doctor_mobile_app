import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/core/infrastructure/auth/claims_token_service.dart';
import 'package:soul_doctor/app/domain/model/session_data.dart';
import 'package:soul_doctor/app/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;
  final ClaimsTokenService _claimsTokenService = ClaimsTokenService.instance;

  LoginUseCase(this._authRepository);

  Future<Either<Failure, bool>> execute({
    required String email,
    required String pin,
  }) async {
    var response = await _authRepository.login(email: email, pin: pin);

    return response.fold(
      (failure) {
        return Left(failure);
      },
      (success) async {
        if (success.accessToken == null || success.refreshToken == null) {
          return Left(Failure("Gagal mendapatkan data sesi"));
        }
        var accessToken = success.accessToken!;
        var refreshToken = success.refreshToken!;

        _authRepository.onSaveToken(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );

        await _claimsTokenService.saveSessionData(
          SessionData.fromToken(accessToken),
        );

        return Right(true);
      },
    );
  }
}
