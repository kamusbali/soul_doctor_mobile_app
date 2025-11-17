import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/helpers/ui_feedback_utils.dart';
import 'package:soul_doctor/app/modules/consultation/controllers/consultation_controller.dart';
import 'package:soul_doctor/app/modules/doctor_home/controllers/doctor_home_controller.dart';
import 'package:soul_doctor/app/modules/patient/controllers/patient_controller.dart';
import 'package:soul_doctor/app/modules/user_home/controllers/user_home_controller.dart';
import 'package:soul_doctor/app/modules/visit/controllers/visit_controller.dart';
import 'package:soul_doctor/app/modules/volunteer_home/controllers/volunteer_home_controller.dart';
import 'package:soul_doctor/app/modules/wrapper/controllers/wrapper_controller.dart';

import '../../patient_history/controllers/patient_history_controller.dart';

class AccountController extends GetxController {
  final AuthUseCases _authUseCases;

  AccountController(this._authUseCases);

  var version = "".obs;
  late WrapperController wrapperController;

  @override
  void onInit() {
    super.onInit();

    wrapperController = Get.find<WrapperController>();

    getAppInfo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version.value = packageInfo.version;
  }

  void onLogout() async {
    UiFeedbackUtils.showDialog(
      title: "Keluar",
      body: "Apakah anda yakin ingin keluar?",
      primaryButtonText: "Iya",
      onPrimaryPressed: () async {
        await _authUseCases.logoutUseCase.execute();

        if (Get.isRegistered<PatientHistoryController>()) {
          Get.find<PatientHistoryController>().onLogoutClear();
        }

        // if (Get.isRegistered<VisitController>()) {
        //   Get.find<VisitController>().onInit();
        // }

        // if (Get.isRegistered<ConsultationController>()) {
        //   Get.find<ConsultationController>().onInit();
        // }

        // if (Get.isRegistered<PatientController>()) {
        //   Get.find<PatientController>().onInit();
        // }

        if (Get.isRegistered<UserHomeController>()) {
          Get.find<UserHomeController>().onLogoutClear();
        }

        // if (Get.isRegistered<VolunteerHomeController>()) {
        //   Get.find<VolunteerHomeController>().onInit();
        // }

        // if (Get.isRegistered<DoctorHomeController>()) {
        //   Get.find<VolunteerHomeController>().onInit();
        // }

        wrapperController.onLogoutClear();
        wrapperController.onChangeTab(0);
        Get.back();
      },
      secondaryButtonText: "Tidak",
      onSecondaryPressed: () {
        Get.back();
      },
      barrierDismissible: false,
    );
  }
}
