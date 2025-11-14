import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/helpers/ui_feedback_utils.dart';
import 'package:soul_doctor/app/modules/create_pin/settings/create_pin_settings.dart';
import 'package:soul_doctor/app/modules/otp_verification/settings/otp_verification_settings.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';

class OtpVerificationController extends GetxController {
  final AuthUseCases _authUseCases;

  OtpVerificationController(this._authUseCases);

  OtpVerificationSettings otpVerificationSettings = Get.arguments;

  final count = 0.obs;
  var isUserCanResend = false.obs;
  final duration = 60;

  Timer? _timer;

  final TextEditingController otpController = TextEditingController();

  var verificationStatus = Resource<bool>.none().obs;

  var isCanVerification = false.obs;

  @override
  void onInit() {
    super.onInit();

    isUserCanResend.value = true;
    startTimer();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    _timer?.cancel();
  }

  void startTimer() {
    count.value = duration;
    isUserCanResend.value = false;
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      count.value--;
      if (count.value == 0) {
        stopTimer();
        isUserCanResend.value = true;
        resetTimer();
      }
    });
  }

  void resetTimer() {
    count.value = 0;
  }

  void stopTimer() {
    _timer?.cancel();
  }

  void onChangedOtpValue(String value) {
    if (value.isEmpty) {
      isCanVerification.value = false;
      return;
    }

    isCanVerification.value = true;
  }

  void onVerifOtp() async {
    verificationStatus.value = Resource.loading();
    var response = await _authUseCases.verifyOtpUseCase.execute(
      transactionId: otpVerificationSettings.transactionOtp.transactionId,
      otp: otpController.text,
    );

    response.fold(
      (failure) {
        verificationStatus.value = Resource.error(failure.message);
        UiFeedbackUtils.showSnackbar("Terjadi Masalah", failure.message);
      },
      (success) {
        verificationStatus.value = Resource.success(true);
        UiFeedbackUtils.showDialog(
          title: "Sukses",
          body:
              "Berhasil untuk diverifikasi, silahkan membuat pin anda!",

          primaryButtonText: "Oke",
          onPrimaryPressed: () {
            Get.back();
            Get.offNamed(
              Routes.CREATE_PIN,
              arguments: CreatePinSettings(
                transactionOtp: otpVerificationSettings.transactionOtp,
                phoneNumber: otpVerificationSettings.phoneNumber,
              ),
            );
          },
          barrierDismissible: false,
        );
      },
    );
  }
}
