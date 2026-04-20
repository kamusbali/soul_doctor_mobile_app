import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/use_case/daily_report_use_cases/daily_report_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/daily_report_use_cases/markdown_patient_daily_report_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/daily_report_use_cases/report_daily_use_case.dart';

class DailyReportUseCasesInjection {
  static void inject() {
    Get.lazyPut<ReportDailyUseCase>(
      () => ReportDailyUseCase(Get.find()),
      fenix: true,
    );
    Get.lazyPut<MarkdownPatientDailyReportUseCase>(
      () => MarkdownPatientDailyReportUseCase(Get.find()),
      fenix: true,
    );

    Get.lazyPut<DailyReportUseCases>(
      () => DailyReportUseCases(
        reportDailyUseCase: Get.find(),
        markdownPatientDailyReportUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
