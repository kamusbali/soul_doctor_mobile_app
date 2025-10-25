import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/common/pagination.dart';
import 'package:soul_doctor/app/domain/model/consultation_status.dart';
import 'package:soul_doctor/app/domain/model/role.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/consultation_use_cases.dart';
import 'package:soul_doctor/app/helpers/ui_feedback_utils.dart';

import '../../../common/resource.dart';
import '../../../core/error/error_type.dart';
import '../../../domain/model/consultation.dart';
import '../../../routes/app_pages.dart';

class PatientHistoryController extends GetxController {
  final ConsultationUseCases _consultationUseCases;
  final AuthUseCases _authUseCases;

  PatientHistoryController(this._consultationUseCases, this._authUseCases);

  var selectedIndex = 0.obs;
  ConsultationStatus selectedState = Role.patient.status[0];

  final consultation = Resource<Pagination<List<Consultation>>>.none().obs;

  final searchController = TextEditingController();

  var isMedication = false;
  var isTherapy = false;
  var isVisit = false;

  var isMedicationTemp = false.obs;
  var isTherapyTemp = false.obs;
  var isVisitTemp = false.obs;

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

  void getConsultation() async {
    consultation.value = Resource.loading();
    print("Ngambil data ..");

    var data = await _consultationUseCases.getConsultationUseCase.execute(
      state: selectedState,
      medication: isMedication,
      therapy: isTherapy,
      visit: isVisit,
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
        consultation.value = Resource.success(success);
      },
    );
  }

  void changeIndexTab(int index, ConsultationStatus state) {
    selectedIndex.value = index;
    selectedState = state;

    getConsultation();
    update();
  }

  void onOpenBottomSheet() {
    isMedicationTemp.value = isMedication;
    isTherapyTemp.value = isTherapy;
    isVisitTemp.value = isVisit;
  }

  void onChangeIsMedicationTemp(bool? value) {
    if (value != null) isMedicationTemp.value = value;
  }

  void onChangeIsTherapyTemp(bool? value) {
    if (value != null) isTherapyTemp.value = value;
  }

  void onChangeIsVisitTemp(bool? value) {
    if (value != null) isVisitTemp.value = value;
  }

  void onConfirmFilter() {
    isMedication = isMedicationTemp.value;
    isTherapy = isTherapyTemp.value;
    isVisit = isVisitTemp.value;

    getConsultation();

    Get.back();
  }

  void onClearSearchText() {
    searchController.text = "";
  }
}
