import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/use_case/patient_use_cases/patient_use_cases.dart';
import 'package:soul_doctor/app/modules/patient_detail_history/settings/patient_detail_history_settings.dart';

class PatientDetailHistoryController extends GetxController {
  PatientDetailHistorySettings patientDetailHistorySettings = Get.arguments;

  final PatientUseCases _patientUseCases;

  PatientDetailHistoryController(this._patientUseCases);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onGetPatientDetailData() async{
    // var response = await _patientUseCases.
  }
}
