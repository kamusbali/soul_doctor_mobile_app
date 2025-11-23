import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/local/provider/sync_provider_data.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/compact_consultation_detail_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/consultation_detail_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/consultation_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/provider/consultation_provider.dart';
import 'package:soul_doctor/app/domain/model/consultation_status.dart';
import 'package:soul_doctor/app/domain/repository/consultation_repository.dart';

import '../../core/error/error_type.dart';
import '../../domain/model/consultation_type.dart';
import '../source/remote/dto/common/response_wrapper.dart';

class ConsultationRepositoryImpl implements ConsultationRepository {
  final ConsultationProvider _consultationProvider;
  final SyncProviderData _syncProviderData = SyncProviderData.instance;

  ConsultationRepositoryImpl(this._consultationProvider);

  @override
  Future<Either<Failure, ConsultationResponseDto>> getConsultation({
    required ConsultationStatus state,
    bool? medication,
    bool? therapy,
    bool? visit,
    int? age,
    bool? firstConsultation,
    String? patientId,
    String? q,
    int? p,
    int? pp,
  }) async {
    final bool isConnected = await InternetConnection().hasInternetAccess;

    if (isConnected) {
      try {
        var response = await _consultationProvider.getConsultation(
          state: state.id,
          medication: medication,
          therapy: therapy,
          visit: visit,
          age: age,
          firstConsultation: firstConsultation,
          patientId: patientId,
          q: q,
          p: p,
          pp: p,
        );
        await _syncProviderData.addConsultationStateData(
          state: state.id,
          consultationResponseDto: response.data!,
        );
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
              Failure(
                networkErrorMessage.message ?? "Unexpected Error Occured",
              ),
            );
          } catch (e) {
            return Left(Failure("Error dalam melakukan konversi"));
          }
        }
        return Left(Failure(e.toString()));
      }
    }

    var localData = _syncProviderData.getLocalConsultation(state: state.id);
    return localData.fold(
      (failure) {
        return Left(failure);
      },
      (success) {
        return Right(success);
      },
    );
  }

  @override
  Future<Either<Failure, ConsultationDetailResponseDto>> getConsultationDetail(
    String id,
  ) async {
    final bool isConnected = await InternetConnection().hasInternetAccess;

    if (isConnected) {
      try {
        var response = await _consultationProvider.getConsultationDetail(id);
        await _syncProviderData.addConsultationDetailData(
          id: id,
          consultationDetailResponseDto: response.data!,
        );
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
              Failure(
                networkErrorMessage.message ?? "Unexpected Error Occured",
              ),
            );
          } catch (e) {
            return Left(Failure("Error dalam melakukan konversi"));
          }
        }
        return Left(Failure(e.toString()));
      }
    }

    var localData = _syncProviderData.getLocalDetailConsultation(id: id);
    return localData.fold(
      (failure) {
        return Left(failure);
      },
      (success) {
        return Right(success);
      },
    );
  }

  @override
  Future<Either<Failure, CompactConsultationDetailResponseDto>>
  getCompactConsultationDetail(String id) async {
    try {
      var response = await _consultationProvider.getCompactConsultationDetail(
        id,
      );
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
  Future<Either<Failure, bool>> createRequestConsultation({
    required String patientId,
    required String symptom,
    required DateTime startDate,
    required MultipartFile? image,
    required ConsultationType type,
  }) async {
    try {
      await _consultationProvider.createRequestConsultation(
        patientId: patientId,
        symptom: symptom,
        startDate: startDate,
        image: image,
        type: type.id,
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
}
