import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/diagnosis_use_cases/diagnosis_use_cases.dart';
import 'package:soul_doctor/app/modules/diagnosis_form/settings/diagnosis_form_settings.dart';

import '../../../core/error/error_type.dart';
import '../../../helpers/ui_feedback_utils.dart';
import '../../../routes/app_pages.dart';

class DiagnosisFormController extends GetxController {
  final DiagnosisUseCases _diagnosisUseCases;
  final AuthUseCases _authUseCases;

  DiagnosisFormController(this._diagnosisUseCases, this._authUseCases);

  DiagnosisFormSettings diagnosisFormSettings = Get.arguments;

  final diagnosisController = TextEditingController();
  final medicationController = TextEditingController();
  final therapyController = TextEditingController();
  final notesController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final diagnosisStatus = Resource<bool>.none().obs;

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

  void onCreateDiagnosis() async {
    if (!formKey.currentState!.validate()) {
      UiFeedbackUtils.showSnackbar(
        "Data Riwayat Tidak Lengkap",
        "Silahkan lengkapi data!",
      );
      return;
    }

    var response = await _diagnosisUseCases.createDiagnosisUseCase.execute(
      consultationId: diagnosisFormSettings.consultationid,
      diagnosis: diagnosisController.text,
      medication: medicationController.text.isEmpty
          ? null
          : medicationController.text,
      therapy: therapyController.text.isEmpty ? null : therapyController.text,
      note: notesController.text.isEmpty ? null : notesController.text,
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
          diagnosisStatus.value = Resource.error(failure.message);
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
        diagnosisStatus.value = Resource.error(failure.message);
      },
      (success) {
        if (!success) {
          if (Get.isDialogOpen != true) {
            UiFeedbackUtils.showDialog(
              title: "Terjadi Kesalahan",
              body: "Tidak dapat menambah report visit",
              primaryButtonText: "Okay",
              onPrimaryPressed: () {
                Get.back();
              },
            );
          }
          return;
        }
        UiFeedbackUtils.showDialog(
          title: "Sukses",
          body: "Sukses menambah report visit",
          primaryButtonText: "Okay",
          onPrimaryPressed: () {
            Get.back();
            Get.back();
          },
        );
        diagnosisStatus.value = Resource.success(success);
        Get.offAllNamed(Routes.VOLUNTEER_WRAPPER);
      },
    );
  }
}
