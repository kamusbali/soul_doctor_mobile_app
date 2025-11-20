import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/consultation_use_cases.dart';

import '../../../common/pagination.dart';
import '../../../common/resource.dart';
import '../../../core/error/error_type.dart';
import '../../../domain/model/consultation.dart';
import '../../../domain/model/consultation_status.dart';
import '../../../domain/model/role.dart';
import '../../../helpers/ui_feedback_utils.dart';
import '../../../routes/app_pages.dart';

class ConsultationController extends GetxController {
  final AuthUseCases _authUseCases;
  final ConsultationUseCases _consultationUseCases;

  ConsultationController(this._authUseCases, this._consultationUseCases);

  var isAgeGreaterThan50 = false;
  var isFirstConsultation = false;

  var isAgeGreaterThan50Temp = false.obs;
  var isFirstConsultationTemp = false.obs;

  final consultation = Resource<Pagination<List<Consultation>>>.none().obs;

  final searchController = TextEditingController();

  var selectedIndex = 0.obs;
  ConsultationStatus selectedState = Role.patient.status[0];

  @override
  void onInit() {
    super.onInit();
    getConsultation();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeIndexTab(int index, ConsultationStatus state) {
    selectedIndex.value = index;
    selectedState = state;

    getConsultation();
    update();
  }

  void onOpenBottomSheet() {
    isAgeGreaterThan50Temp.value = isAgeGreaterThan50;
    isFirstConsultationTemp.value = isFirstConsultation;
  }

  void onChangeIsMedicationTemp(bool? value) {
    if (value != null) isAgeGreaterThan50Temp.value = value;
  }

  void onChangeIsTherapyTemp(bool? value) {
    if (value != null) isFirstConsultationTemp.value = value;
  }

  void onConfirmFilter() {
    isAgeGreaterThan50 = isAgeGreaterThan50Temp.value;
    isFirstConsultation = isFirstConsultationTemp.value;

    getConsultation();

    Get.back();
  }

  void getConsultation() async {
    consultation.value = Resource.loading();

    var data = await _consultationUseCases.getConsultationUseCase.execute(
      state: selectedState,
      age: isAgeGreaterThan50 ? 50 : null,
      firstConsultation: isFirstConsultation,
      q: searchController.text,
      pp: 9999,
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
              Get.offAllNamed(Routes.GUEST_WRAPPER);
            },
          );
          consultation.value = Resource.error(failure.message);
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
        consultation.value = Resource.error(failure.message);
      },
      (success) {
        if (success.data.isEmpty) {
          consultation.value = Resource.empty();
          return;
        }
        consultation.value = Resource.success(success);
      },
    );
  }

  void onClearSearchText() {
    searchController.text = "";
  }
}
