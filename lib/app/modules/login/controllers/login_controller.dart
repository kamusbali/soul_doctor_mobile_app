import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/model/role.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/helpers/ui_feedback_utils.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final AuthUseCases _authUseCases;

  LoginController(this._authUseCases);

  var isPinVisible = false.obs;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final pinController = TextEditingController();

  var loginStatus = Resource<bool>.none().obs;

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

  void onChangePinVisibility() {
    isPinVisible.value = !isPinVisible.value;
  }

  void onLogin() async {
    if (!formKey.currentState!.validate()) {
      UiFeedbackUtils.showSnackbar(
        "Tidak dapat melanjutkan",
        "Tolong isi semua data terlebih dahulu!",
      );
      return;
    }

    loginStatus.value = Resource.loading();

    final result = await _authUseCases.loginUseCase.execute(
      email: emailController.text,
      pin: pinController.text,
    );

    result.fold(
      (failure) {
        loginStatus.value = Resource.error(failure.message);
        UiFeedbackUtils.showSnackbar("Error", failure.message);
      },
      (success) {
        loginStatus.value = Resource.success(success);
        UiFeedbackUtils.showDialog(
          title: "Sukses",
          body: "Login berhasil!",
          primaryButtonText: "Okay",
          onPrimaryPressed: () async {
            var sessionData = await _authUseCases.getSessionDataUseCases
                .execute();
            if (sessionData?.role == Role.patient) {
              Get.offAllNamed(Routes.PATIENT_WRAPPER);
              return;
            } else if (sessionData?.role == Role.caregiver) {
              Get.offAllNamed(Routes.CAREGIVER_WRAPPER);
              return;
            } else if (sessionData?.role == Role.volunteer) {
              Get.offAllNamed(Routes.VOLUNTEER_WRAPPER);
              return;
            } else if (sessionData?.role == Role.doctor) {
              Get.offAllNamed(Routes.DOCTOR_WRAPPER);
              return;
            }

            Get.offAllNamed(Routes.GUEST_WRAPPER);
          },
        );
      },
    );
  }
}
