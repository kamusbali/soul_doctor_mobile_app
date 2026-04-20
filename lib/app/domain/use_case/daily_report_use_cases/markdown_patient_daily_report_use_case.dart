import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/daily_report_item_response_dto.dart';

import '../../repository/daily_report_repository.dart';

class MarkdownPatientDailyReportUseCase {
  final DailyReportRepository _dailyReportRepository;

  MarkdownPatientDailyReportUseCase(this._dailyReportRepository);

  Future<Either<Failure, String>> execute({required String patientId}) async {
    var response = await _dailyReportRepository.getDailyReports(
      patiendId: patientId,
    );
    return response.fold((failure) => Left(failure), (dailyReportResponseDto) {
      String markdown = "";
      for (var report in (dailyReportResponseDto.dailyReports ?? []).map(
        (e) => e.toDailyReportItem(),
      )) {
        markdown += "## Laporan Harian - ${report.reportDate.toLocal()}\n\n";
        markdown += "**Observasi:** ${report.observation}\n\n";
        markdown +=
            "**Efek Samping:** ${report.sideEffect ? "Ya" : "Tidak"}\n\n";
        markdown +=
            "**Status Hasil Kunjungan:** ${report.resultStatus.name}\n\n";
        markdown += "**Jam Tidur:** ${report.sleepHour} jam\n\n";
        markdown +=
            "**Kondisi Setelah Tidur:** ${report.afterSleepCondition.name}\n\n";
        markdown += "**Kondisi Obat:** ${report.medicineCondition.name}\n\n";
        markdown += "**Komunikasi:** ${report.communication.name}\n\n";
        markdown += "**Perawatan Diri:** ${report.selfCare.name}\n\n";
        if (report.doingCeremony != null) {
          markdown +=
              "**Melakukan Upacara:** ${report.doingCeremony! ? "Ya" : "Tidak"}\n\n";
          if (report.doingCeremony! && report.ceremonyName != null) {
            markdown += "**Nama Upacara:** ${report.ceremonyName}\n\n";
            markdown +=
                "**Pemuput Upacara:** ${report.pemuputUpacaraId.name}\n\n";
          }
        }
      }
      return Right(markdown);
    });
  }
}
