import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';

import '../../../core/error/error_type.dart';
import '../../../domain/use_case/auth_use_cases/auth_use_cases.dart';
import '../../../helpers/ui_feedback_utils.dart';

class UpdatePinController extends GetxController {
  final AuthUseCases _authUseCases;

  UpdatePinController(this._authUseCases);

  final formKey = GlobalKey<FormState>();

  final oldPinController = TextEditingController();
  var isOldPinVisible = false.obs;

  final newPinController = TextEditingController();
  var isNewPinVisible = false.obs;

  final newPinRepeatController = TextEditingController();
  var isNewPinRepeatVisible = false.obs;

  var updatePinStatus = Resource<bool>.none().obs;

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

  void onChangeOldPinVisibility() {
    isOldPinVisible.value = !isOldPinVisible.value;
  }

  void onChangePinVisibility() {
    isNewPinVisible.value = !isNewPinVisible.value;
  }

  void onChangePinRepeatVisibility() {
    isNewPinRepeatVisible.value = !isNewPinRepeatVisible.value;
  }

  void onUpdatePin() async {
    if (!formKey.currentState!.validate()) {
      UiFeedbackUtils.showSnackbar(
        "Lengkapi!",
        "Tolong lengkapi data yang diperlukan!",
      );
      return;
    }

    updatePinStatus.value = Resource.loading();

    var response = await _authUseCases.updatePinUseCase.execute(
      oldPin: oldPinController.text,
      newPin: newPinController.text,
      newPinRepeat: newPinRepeatController.text,
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
              Get.offAllNamed(Routes.WRAPPER);
            },
          );
          updatePinStatus.value = Resource.error(failure.message);
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
        updatePinStatus.value = Resource.error(failure.message);
      },
      (success) {
        UiFeedbackUtils.showDialog(
          title: "Sukses",
          body: "Berhasil mengupdate pin, silahkan login kembali!",
          primaryButtonText: "Okay",
          onPrimaryPressed: () async {
            updatePinStatus.value = Resource.success(success);
            await _authUseCases.logoutUseCase.execute();
            Get.offAllNamed(Routes.WRAPPER);
          },
          barrierDismissible: false,
        );
      },
    );
  }
}
