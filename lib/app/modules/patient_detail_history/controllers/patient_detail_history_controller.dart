import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/core/error/error_type.dart';
import 'package:soul_doctor/app/domain/model/patient_detail.dart';
import 'package:soul_doctor/app/domain/use_case/patient_use_cases/patient_use_cases.dart';
import 'package:soul_doctor/app/helpers/ui_feedback_utils.dart';
import 'package:soul_doctor/app/modules/patient_detail_history/settings/patient_detail_history_settings.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';

class PatientDetailHistoryController extends GetxController {
  PatientDetailHistorySettings patientDetailHistorySettings = Get.arguments;

  final PatientUseCases _patientUseCases;

  PatientDetailHistoryController(this._patientUseCases);

  var patientDataStatus = Resource<PatientDetail>.none().obs;

  @override
  void onInit() {
    super.onInit();

    onGetPatientDetailData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onGetPatientDetailData() async {
    patientDataStatus.value == Resource.loading();

    var response = await _patientUseCases.getPatientDetailUseCase.execute(
      patientDetailHistorySettings.patientId,
    );

    response.fold(
      (failure) {
        if (failure.errorType == ErrorType.sessionExpired) {
          UiFeedbackUtils.showDialog(
            title: "Sesi Berakhir",
            body: failure.message,
            primaryButtonText: "Oke",
            onPrimaryPressed: () {
              Get.offAllNamed(Routes.WRAPPER);
            },
          );
          return;
        }
        UiFeedbackUtils.showSnackbar("Terjadi Kesalahan", failure.message);
        patientDataStatus.value = Resource.error(failure.message);
      },
      (success) {
        patientDataStatus.value = Resource.success(success);
      },
    );
  }
}
