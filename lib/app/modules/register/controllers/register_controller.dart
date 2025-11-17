import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/helpers/ui_feedback_utils.dart';
import 'package:soul_doctor/app/modules/otp_verification/settings/otp_verification_settings.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final AuthUseCases _authUseCases;

  RegisterController(this._authUseCases);

  final TextEditingController numberTextEditingController =
      TextEditingController();

  var registerResult = Resource<bool>.none().obs;

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

  void onRegister() async {
    registerResult.value = Resource.loading();

    var response = await _authUseCases.registerUseCase.execute(
      phone: numberTextEditingController.text,
    );

    response.fold(
      (failure) {
        registerResult.value = Resource.error(failure.message);
        UiFeedbackUtils.showSnackbar("Error", failure.message);
      },
      (success) {
        registerResult.value = Resource.success(true);
        UiFeedbackUtils.showDialog(
          title: "Kode OTP Dikirim",
          body:
              "Kode OTP sudah dikirim ke nomor tersebut silahkan masukkan kode pada halaman selanjutnya!",
          primaryButtonText: "Oke",
          onPrimaryPressed: () {
            Get.back();
            Get.offNamed(
              Routes.OTP_VERIFICATION,
              arguments: OtpVerificationSettings(
                transactionOtp: success,
                phoneNumber: numberTextEditingController.text,
              ),
            );
          },
        );
      },
    );
  }
}
