import 'package:soul_doctor/app/domain/use_case/daily_report_use_cases/markdown_patient_daily_report_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/daily_report_use_cases/report_daily_use_case.dart';

import 'get_patient_report_use_case.dart';

class DailyReportUseCases {
  ReportDailyUseCase reportDailyUseCase;
  GetPatientReportUseCase getPatientReportUseCase;
  MarkdownPatientDailyReportUseCase markdownPatientDailyReportUseCase;

  DailyReportUseCases({
    required this.reportDailyUseCase,
    required this.getPatientReportUseCase,
    required this.markdownPatientDailyReportUseCase,
  });
}
