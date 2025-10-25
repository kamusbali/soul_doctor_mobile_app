import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:soul_doctor/app/common/constant/default.dart';
import 'package:soul_doctor/app/core/error/error_type.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/core/infrastructure/auth/role_manager.dart';
import 'package:soul_doctor/app/data/source/remote/dto/common/response_wrapper.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/profile_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/compact_user_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/profile_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/provider/profile_provider.dart';
import 'package:soul_doctor/app/domain/repository/profile_repository.dart';

import '../../domain/model/role.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileProvider _profileProvider;
  final RoleManager _roleManager = RoleManager.instance;

  ProfileRepositoryImpl(this._profileProvider);

  @override
  Future<Either<Failure, CompactUserResponseDto?>> getCompactProfile() async {
    try {
      var response = await _profileProvider.getCompactProfile();

      if (response.data == null) return Left(Failure("Tidak ada data profile"));

      _roleManager.saveCurrentRole(response.data!.role ?? Default.defaultInt);

      return Right(response.data);
    } catch (e) {
      if (e is DioException) {
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
      }
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> createProfile({
    required Role role,
    required String fullname,
    required String nickname,
    required String phone,
    required String email,
    required DateTime birthday,
    required bool gender,
    required String maritalStatusId,
    required String lastEducationId,
    required String job,
    required String religionId,
    required String address,
  }) async {
    try {
      await _profileProvider.createProfile(
        ProfileRequest(
          role: role.id,
          fullname: fullname,
          nickname: nickname,
          phone: phone,
          email: email,
          birthday: birthday,
          gender: gender,
          maritalStatusId: maritalStatusId,
          lastEducationId: lastEducationId,
          job: job,
          religionId: religionId,
          address: address,
        ),
      );
      return Right(true);
    } catch (e) {
      if (e is DioException) {
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
      }
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updateProfile({
    required Role role,
    required String fullname,
    required String nickname,
    required String phone,
    required String email,
    required DateTime birthday,
    required bool gender,
    required String maritalStatusId,
    required String lastEducationId,
    required String job,
    required String religionId,
    required String address,
  }) async {
    try {
      await _profileProvider.updateProfile(
        ProfileRequest(
          role: role.id,
          fullname: fullname,
          nickname: nickname,
          phone: phone,
          email: email,
          birthday: birthday,
          gender: gender,
          maritalStatusId: maritalStatusId,
          lastEducationId: lastEducationId,
          job: job,
          religionId: religionId,
          address: address,
        ),
      );
      return Right(true);
    } catch (e) {
      if (e is DioException) {
        print(e);
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
      }
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileResponseDto>> getProfile() async {
    try {
      var response = await _profileProvider.getProfile();
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
}
