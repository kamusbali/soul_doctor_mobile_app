import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/patient_detail_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/patient_response_dto.dart';

import '../model/education.dart';
import '../model/gender.dart';
import '../model/marital.dart';
import '../model/religion.dart';

abstract class PatientRepository {
  Future<Either<Failure, bool>> createPatientOnCaregiver({
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

  Future<Either<Failure, PatientResponseDto>> getPatient({String? q});

  Future<Either<Failure, PatientDetailResponseDto>> getPatientDetail(String id);
}
