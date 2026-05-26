import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/use_case/daily_report_use_cases/daily_report_use_cases.dart';

import '../../../common/resource.dart';
import '../../../core/error/error_type.dart';
import '../../../domain/model/daily_report_item.dart';
import '../../../domain/model/session_data.dart';
import '../../../domain/use_case/auth_use_cases/auth_use_cases.dart'
    show AuthUseCases;
import '../../../helpers/ui_feedback_utils.dart';
import '../../../routes/app_pages.dart';
import '../settings/report_daily_patient_detail_settings.dart';

class ReportDailyPatientDetailController extends GetxController {
  final DailyReportUseCases _dailyReportUseCases;
  final AuthUseCases _authUseCases;

  ReportDailyPatientDetailController(
    this._dailyReportUseCases,
    this._authUseCases,
  );

  ReportDailyPatientDetailSettings reportDailyPatientDetailSettings =
      Get.arguments;

  var reportDetail = Resource<List<DailyReportItem>>.none().obs;

  Rx<SessionData?> user = (null as SessionData?).obs;

  @override
  void onInit() {
    super.onInit();
    onGetSessionData();
    onGetConsultationData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onGetSessionData() async {
    user.value = await _authUseCases.getSessionDataUseCases.execute();
  }

  void onGetConsultationData() async {
    reportDetail.value = Resource.loading();
    var response = await _dailyReportUseCases.getPatientReportUseCase.execute(
      reportDailyPatientDetailSettings.id,
    );

    response.fold(
      (failure) {
        if (failure.errorType == ErrorType.sessionExpired) {
          UiFeedbackUtils.showDialog(
            title: "Sesi Login Kadaluarsa",
            body: "Silahkan login kembali untuk dapat mengakses fitur",
            primaryButtonText: "Okay",
            onPrimaryPressed: () async {
              await _authUseCases.logoutUseCase.execute();
              Get.offAllNamed(Routes.GUEST_WRAPPER);
            },
          );
          reportDetail.value = Resource.error(failure.message);
          return;
        }

        UiFeedbackUtils.showDialog(
          title: "Terjadi Kesalahan",
          body: failure.message,
          primaryButtonText: "Okay",
          onPrimaryPressed: () {
            Get.back();
          },
        );
        reportDetail.value = Resource.error(failure.message);
      },
      (success) {
        reportDetail.value = Resource.success(success);
      },
    );
  }
}
