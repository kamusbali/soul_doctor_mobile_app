import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/model/patient.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/patient_use_cases/patient_use_cases.dart';

import '../../../common/resource.dart';
import '../../../core/error/error_type.dart';
import '../../../helpers/ui_feedback_utils.dart';
import '../../../routes/app_pages.dart';

class PatientController extends GetxController {
  final PatientUseCases _patientUseCases;
  final AuthUseCases _authUseCases;

  PatientController(this._patientUseCases, this._authUseCases);

  final searchController = TextEditingController();

  final patient = Resource<List<Patient>>.none().obs;

  var isMale = false;
  var isFemale = false;
  var isAgeGreaterThan50 = false;

  var isMaleTemp = false.obs;
  var isFemaleTemp = false.obs;
  var isAgeGreaterThan50Temp = false.obs;

  @override
  void onInit() {
    super.onInit();

    getPatient();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getPatient() async {
    patient.value = Resource.loading();

    var data = await _patientUseCases.getPatientUseCase.execute(
      q: searchController.text,
    );

    data.fold(
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
          patient.value = Resource.error(failure.message);
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
        patient.value = Resource.error(failure.message);
      },
      (succes) {
        patient.value = Resource.success(succes);
      },
    );
  }

  void onOpenBottomSheet() {
    isMaleTemp.value = isMale;
    isFemaleTemp.value = isFemale;
    isAgeGreaterThan50Temp.value = isAgeGreaterThan50;
  }

  void onChangeIsMaleTemp(bool? value) {
    if (value != null) isMaleTemp.value = value;
  }

  void onChangeIsFemaleTemp(bool? value) {
    if (value != null) isFemaleTemp.value = value;
  }

  void onChangeIsAgeGreaterThan50Temp(bool? value) {
    if (value != null) isAgeGreaterThan50Temp.value = value;
  }

  void onConfirmFilter() {
    isMale = isMaleTemp.value;
    isFemale = isFemaleTemp.value;
    isAgeGreaterThan50 = isAgeGreaterThan50Temp.value;

    getPatient();

    Get.back();
  }

  void onClearSearchText() {
    searchController.text = "";
  }
}
