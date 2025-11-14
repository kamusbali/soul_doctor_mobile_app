import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/helpers/ui_feedback_utils.dart';

class LoginController extends GetxController {
  final AuthUseCases _authUseCases;

  LoginController(this._authUseCases);

  var isPinVisible = false.obs;

  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
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
      phone: phoneController.text,
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
          onPrimaryPressed: () {
            Get.back();
            Get.back();
          },
        );
      },
    );
  }
}
