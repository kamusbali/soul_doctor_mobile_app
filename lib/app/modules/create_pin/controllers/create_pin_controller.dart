import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/helpers/ui_feedback_utils.dart';
import 'package:soul_doctor/app/modules/create_pin/settings/create_pin_settings.dart';
import 'package:soul_doctor/app/modules/input_profile/settings/input_profile_settings.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';

class CreatePinController extends GetxController {
  final AuthUseCases _authUseCases;

  CreatePinController(this._authUseCases);

  CreatePinSettings createPinSettings = Get.arguments;

  final formKey = GlobalKey<FormState>();

  final pinController = TextEditingController();
  var isPinVisible = false.obs;

  final pinRepeatController = TextEditingController();
  var isPinRepeatVisible = false.obs;

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

  void onChangePinRepeatVisibility() {
    isPinRepeatVisible.value = !isPinRepeatVisible.value;
  }

  void onCreatePin() async {
    if (!formKey.currentState!.validate()) {
      UiFeedbackUtils.showSnackbar(
        "Lengkapi!",
        "Tolong lengkapi data yang diperlukan!",
      );
      return;
    }

    var response = await _authUseCases.createPinUseCase.execute(
      transactionId: createPinSettings.transactionOtp.transactionId,
      pin: pinController.text,
      pinRepeat: pinRepeatController.text,
    );

    response.fold(
      (failure) {
        UiFeedbackUtils.showSnackbar("Error", failure.message);
      },
      (success) {
        UiFeedbackUtils.showDialog(
          title: "Sukses",
          body: "Berhasil membuat pin, silahkan lengkapi profile anda!",
          primaryButtonText: "Okay",
          onPrimaryPressed: () {
            Get.back();
            Get.offNamed(Routes.LOGIN);
          },
          barrierDismissible: false,
        );
      },
    );
  }
}
