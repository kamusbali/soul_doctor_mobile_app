import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:soul_doctor/app/core/error/error_type.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/remote/dto/common/response_wrapper.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/profile_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/compact_user_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/profile_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/provider/profile_provider.dart';
import 'package:soul_doctor/app/domain/repository/profile_repository.dart';

import '../../domain/model/education.dart';
import '../../domain/model/gender.dart';
import '../../domain/model/marital.dart';
import '../../domain/model/religion.dart';
import '../../domain/model/role.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileProvider _profileProvider;
  // final RoleManager _roleManager = RoleManager.instance;

  ProfileRepositoryImpl(this._profileProvider);

  @override
  Future<Either<Failure, CompactUserResponseDto?>> getCompactProfile() async {
    try {
      var response = await _profileProvider.getCompactProfile();

      if (response.data == null) return Left(Failure("Tidak ada data profile"));

      // _roleManager.saveCurrentRole(
      //   response.data!.role ?? Default.defaultString,
      // );

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
    try {
      await _profileProvider.createProfile(
        ProfileRequest(
          role: role.id,
          fullname: fullname,
          nickname: nickname,
          nik: nik,
          phone: phone,
          email: email,
          birthday: birthday,
          gender: gender.value,
          maritalStatusId: maritalStatusId.id,
          lastEducationId: lastEducationId.id,
          job: job,
          religionId: religionId.id,
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
    required Gender gender,
    required Marital maritalStatusId,
    required Education lastEducationId,
    required String job,
    required Religion religionId,
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
          gender: gender.value,
          maritalStatusId: maritalStatusId.id,
          lastEducationId: lastEducationId.id,
          job: job,
          religionId: religionId.id,
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
