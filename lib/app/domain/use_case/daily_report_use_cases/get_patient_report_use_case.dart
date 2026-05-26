import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/daily_report_item_response_dto.dart';
import 'package:soul_doctor/app/domain/model/daily_report_item.dart';

import '../../repository/daily_report_repository.dart';

class GetPatientReportUseCase {
  final DailyReportRepository _dailyReportRepository;

  GetPatientReportUseCase(this._dailyReportRepository);

  Future<Either<Failure, List<DailyReportItem>>> execute(String id) async {
    var response = await _dailyReportRepository.getDailyReports(patiendId: id);

    return response.fold(
      (failure) {
        return Left(failure);
      },
      (success) {
        return Right(
          success.dailyReports?.map((e) => e.toDailyReportItem()).toList() ??
              [],
        );
      },
    );
  }
}
