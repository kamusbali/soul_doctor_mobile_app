import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/daily_report_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/provider/daily_report_provider.dart';
import 'package:soul_doctor/app/domain/model/after_sleep_condition.dart';
import 'package:soul_doctor/app/domain/model/comunication.dart';
import 'package:soul_doctor/app/domain/model/medicine_condition.dart';
import 'package:soul_doctor/app/domain/model/pemuput_upacara.dart';
import 'package:soul_doctor/app/domain/model/self_care.dart';
import 'package:soul_doctor/app/domain/model/visit_result_status.dart';

import '../../core/error/error_type.dart';
import '../../domain/repository/daily_report_repository.dart';
import '../source/remote/dto/common/response_wrapper.dart';

class DailyReportRepositoryImpl implements DailyReportRepository {
  final DailyReportProvider _dailyReportProvider;

  DailyReportRepositoryImpl(this._dailyReportProvider);

  @override
  Future<Either<Failure, bool>> reportDaily({
    required String patientId,
    required String observation,
    required bool sideEffect,
    required VisitResultStatus resultStatusId,
    String? cooperation,
    String? mainDisease,
    String? autoanamnesis,
    String? diseaseHistory,
    String? familyHistory,
    String? heteroanamnesis,
    String? medicationHistory,
    String? psychiatricStatus,
    List<XFile>? images,
    required int sleepHour,
    required AfterSleepCondition afterSleepCondition,
    required MedicineCondition medicineCondition,
    required Comunication communication,
    required SelfCare selfCare,
    required bool doingCeremony,
    String? ceremonyName,
    PemuputUpacara? pemuputUpcara,
  }) async {
    try {
      print(images?.map((e) => e.path));
      List<MultipartFile> listMultipartImage = [];

      if (images != null) {
        for (final data in images) {
          listMultipartImage.add(
            await MultipartFile.fromFile(data.path, filename: data.name),
          );
        }
      }

      print("Ini Gambar $listMultipartImage");

      await _dailyReportProvider.reportDaily(
        patientId: patientId,
        observation: observation,
        cooperation: cooperation,
        mainDisease: mainDisease,
        autoanamnesis: autoanamnesis,
        diseaseHistory: diseaseHistory,
        familyHistory: familyHistory,
        heteroanamnesis: heteroanamnesis,
        medicationHistory: medicationHistory,
        psychiatricStatus: psychiatricStatus,
        images: listMultipartImage,
        sideEffect: sideEffect,
        resultStatusId: resultStatusId.id,
        sleepHour: sleepHour,
        afterSleepConditionId: afterSleepCondition.id,
        medicineConditionId: medicineCondition.id,
        communicationId: communication.id,
        selfCareId: selfCare.id,
        doingCeremony: doingCeremony,
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
  Future<Either<Failure, DailyReportResponseDto>> getDailyReports({
    required String patiendId,
    int page = 1,
    int limit = 999,
  }) async {
    try {
      var response = await _dailyReportProvider.getDailyReports(
        patiendId: patiendId,
        page: page,
        limit: limit,
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
}
