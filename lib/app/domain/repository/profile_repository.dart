import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/compact_user_response_dto.dart';
import 'package:soul_doctor/app/domain/model/education.dart';
import 'package:soul_doctor/app/domain/model/gender.dart';
import 'package:soul_doctor/app/domain/model/marital.dart';
import 'package:soul_doctor/app/domain/model/religion.dart';
import 'package:soul_doctor/app/domain/model/role.dart';

import '../../core/error/failure.dart';
import '../../data/source/remote/dto/response/profile_response_dto.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileResponseDto>> getProfile();
  Future<Either<Failure, CompactUserResponseDto?>> getCompactProfile();
  Future<Either<Failure, bool>> createProfile({
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
  });
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
  });
}
