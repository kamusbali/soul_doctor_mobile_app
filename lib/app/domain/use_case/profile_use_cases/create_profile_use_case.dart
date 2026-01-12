import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/core/infrastructure/auth/refresh_api_client.dart';
import 'package:soul_doctor/app/domain/model/education.dart';
import 'package:soul_doctor/app/domain/model/gender.dart';
import 'package:soul_doctor/app/domain/model/marital.dart';
import 'package:soul_doctor/app/domain/model/religion.dart';
import 'package:soul_doctor/app/domain/repository/auth_repository.dart';
import 'package:soul_doctor/app/domain/repository/profile_repository.dart';

import '../../../core/infrastructure/auth/claims_token_service.dart';
import '../../../data/source/local/provider/token_provider.dart';
import '../../model/role.dart';
import '../../model/session_data.dart';

class CreateProfileUseCase {
  final ProfileRepository _profileRepository;
  final RefreshApiClient _refreshApiClient = RefreshApiClient();
  final ClaimsTokenService _claimsTokenService = ClaimsTokenService.instance;
  final AuthRepository _authRepository;
  static final _tokenManager = TokenProvider.instance;

  CreateProfileUseCase(this._profileRepository, this._authRepository);

  Future<Either<Failure, bool>> execute({
    required Role role,
    required String fullname,
    required String nickname,
    required String nik,
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
    var response = await _profileRepository.createProfile(
      role: role,
      fullname: fullname,
      nickname: nickname,
      nik: nik,
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
      (success) async {
        if (success) {
          var refreshToken = await _tokenManager.getRefreshToken();
          if (refreshToken != null) {
            var newToken = await _refreshApiClient.refresh(refreshToken);

            var newAccessToken = newToken.accessToken!;
            var newRefreshToken = newToken.refreshToken!;

            await _authRepository.onSaveToken(
              accessToken: newAccessToken,
              refreshToken: newRefreshToken,
            );

            await _claimsTokenService.saveSessionData(
              SessionData.fromToken(newAccessToken),
            );
          }
        }
        return Right(success);
      },
    );
  }
}
