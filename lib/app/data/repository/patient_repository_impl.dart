import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/local/dto/patient_local_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/create_patient_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/patient_detail_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/patient_item_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/patient_response_dto.dart';
import 'package:soul_doctor/app/domain/repository/patient_repository.dart';

import '../../core/error/error_type.dart';
import '../../domain/model/education.dart';
import '../../domain/model/gender.dart';
import '../../domain/model/marital.dart';
import '../../domain/model/religion.dart';
import '../source/local/provider/patient_local_provider.dart';
import '../source/remote/dto/common/response_wrapper.dart';
import '../source/remote/provider/patient_provider.dart';

class PatientRepositoryImpl implements PatientRepository {
  final PatientProvider _patientProvider;
  final PatientLocalProvider _patientLocalProvider;

  PatientRepositoryImpl(this._patientProvider, this._patientLocalProvider);

  @override
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
  }) async {
    try {
      await _patientProvider.createPatientOnCaregiver(
        CreatePatientRequest(
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
    final bool isConnected = await InternetConnection().hasInternetAccess;

    if (!isConnected) {
      return _getCachedPatients(q: q);
    }

    try {
      var response = await _patientProvider.getPatient(q: q);
      if (response.data == null) return Left(Failure("Data kosong"));

      await _patientLocalProvider.addPatientData(
        patients: response.data!.patients!
            .map((e) => e.toPatientLocalDto())
            .toList(),
      );

      return Right(response.data!);
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          try {
            var networkErrorMessage = ResponseWrapper.fromJson(
              e.response?.data,
              (_) {},
            );
            return Left(
              Failure(
                networkErrorMessage.message ?? "Sesi login kadaluarsa",
                errorType: ErrorType.sessionExpired,
              ),
            );
          } catch (_) {
            return Left(
              Failure(
                "Sesi login kadaluarsa",
                errorType: ErrorType.sessionExpired,
              ),
            );
          }
        }

        // Connectivity checks can briefly report online while the request is
        // already failing. Keep the app usable with the last successful data.
        return _getCachedPatients(q: q);
      }
      return Left(Failure(e.toString()));
    }
  }

  Either<Failure, PatientResponseDto> _getCachedPatients({String? q}) {
    try {
      final localData = _patientLocalProvider.getAllPatientData(query: q);
      if (localData.isEmpty) {
        return Left(
          Failure("Tidak ada koneksi internet dan data lokal kosong"),
        );
      }
      return Right(
        PatientResponseDto(
          patients: localData
              .map((patient) => patient.toPatientItemResponseDto())
              .toList(),
        ),
      );
    } catch (_) {
      return Left(Failure("Data pasien lokal tidak dapat dibaca"));
    }
  }

  @override
  Future<Either<Failure, PatientDetailResponseDto>> getPatientDetail(
    String id,
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
