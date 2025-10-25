import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/create_patient_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/patient_detail_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/patient_response_dto.dart';
import 'package:soul_doctor/app/domain/repository/patient_repository.dart';

import '../../core/error/error_type.dart';
import '../source/remote/dto/common/response_wrapper.dart';
import '../source/remote/provider/patient_provider.dart';

class PatientRepositoryImpl implements PatientRepository {
  final PatientProvider _patientProvider;

  PatientRepositoryImpl(this._patientProvider);

  @override
  Future<Either<Failure, bool>> createPatientOnCaregiver({
    required String fullname,
    required String nickname,
    required String phone,
    required String email,
    required DateTime birthday,
    required bool gender,
    required int maritalStatusId,
    required int lastEducationId,
    required String job,
    required int religionId,
    required String address,
  }) async {
    try {
      await _patientProvider.createPatientOnCaregiver(
        CreatePatientRequest(
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
  Future<Either<Failure, PatientResponseDto>> getPatient({String? q}) async {
    try {
      var response = await _patientProvider.getPatient(q: q);
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
  Future<Either<Failure, PatientDetailResponseDto>> getPatientDetail(
    String id
  ) async {
    try {
      var response = await _patientProvider.getPatientDetail(id);
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
