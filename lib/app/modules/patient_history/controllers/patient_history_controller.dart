import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/common/pagination.dart';
import 'package:soul_doctor/app/core/infrastructure/auth/claims_token_service.dart';
import 'package:soul_doctor/app/domain/model/consultation_status.dart';
import 'package:soul_doctor/app/domain/model/role.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/consultation_use_cases.dart';
import 'package:soul_doctor/app/helpers/ui_feedback_utils.dart';
import 'package:soul_doctor/app/modules/patient_history/settings/patient_history_settings.dart';

import '../../../common/resource.dart';
import '../../../core/error/error_type.dart';
import '../../../domain/model/consultation.dart';
import '../../../routes/app_pages.dart';

class PatientHistoryController extends GetxController {
  final ConsultationUseCases _consultationUseCases;
  final AuthUseCases _authUseCases;
  final ClaimsTokenService _claimsTokenService = ClaimsTokenService.instance;

  final PatientHistorySettings? patientHistorySettings = Get.arguments;

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

  // late final PagingController pagingController =
  //     PagingController<int, Consultation>(
  //       getNextPageKey: (state) =>
  //           state.lastPageIsEmpty ? null : state.nextIntPageKey,
  //       fetchPage: (pageKey) => onFetchPage(pageKey: pageKey),
  //     );

  @override
  void onInit() async {
    super.onInit();
    // onFetchPage(pageKey: 1);
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

  void onLogoutClear() {
    selectedIndex.value = 0;
    selectedState = Role.patient.status[0];
    consultation.value = Resource<Pagination<List<Consultation>>>.none();
    isMedication = false;
    isTherapy = false;
    isVisit = false;
    isMedicationTemp.value = false;
    isTherapyTemp.value = false;
    isVisitTemp.value = false;
  }

  // Future<List<Consultation>> onFetchPage({int pageKey = 1}) async {
  //   print(pageKey);
  //   consultation.value = Resource.loading();

  //   final sessionData = await _claimsTokenService.getSessionData();

  //   if (sessionData == null) {
  //     const message = "Tidak ada user yang tersimpan";
  //     UiFeedbackUtils.showSnackbar("Error", message);
  //     // Wajib: lempar error supaya sesuai return type (bukan return;)
  //     throw Exception(message);
  //   }

  //   final result = await _consultationUseCases.getConsultationUseCase.execute(
  //     p: pageKey,
  //     state: selectedState,
  //     medication: isMedication,
  //     therapy: isTherapy,
  //     visit: isVisit == false ? null : true,
  //     patientId: sessionData.id,
  //     pp: 10,
  //     q: searchController.text,
  //   );

  //   return result.fold(
  //     (failure) {
  //       if (failure.errorType == ErrorType.sessionExpired) {
  //         UiFeedbackUtils.showDialog(
  //           title: "Sesi Login Kadaluarsa",
  //           body: "Silahkan login kembali untuk dapat mengakses fitur",
  //           primaryButtonText: "Okay",
  //           onPrimaryPressed: () async {
  //             await _authUseCases.logoutUseCase.execute();
  //             Get.offAllNamed(Routes.WRAPPER);
  //           },
  //         );
  //       } else {
  //         UiFeedbackUtils.showDialog(
  //           title: "Terjadi Kesalahan",
  //           body: failure.message,
  //           primaryButtonText: "Okay",
  //           onPrimaryPressed: () => Get.back(),
  //         );
  //       }

  //       consultation.value = Resource.error(failure.message);

  //       // Penting: lempar error, jangan `return;`
  //       throw Exception(failure.message);
  //     },
  //     (success) {
  //       final previouslyFetchedItemsCount =
  //           pagingController.value.items?.length ?? 0;

  //       final items = success.data;

  //       if (items.isEmpty) {
  //         consultation.value = Resource.empty();
  //       } else {
  //         consultation.value = Resource.success(success);
  //       }

  //       return items;
  //     },
  //   );
  // }

  void getConsultation() async {
    consultation.value = Resource.loading();

    if (patientHistorySettings == null) {
      var sessionData = await _claimsTokenService.getSessionData();

      if (sessionData == null) {
        UiFeedbackUtils.showSnackbar("Error", "Tidak ada user yang tersimpan");
        return;
      }

      var data = await _consultationUseCases.getConsultationUseCase.execute(
        state: selectedState,
        pp: 99,
        medication: isMedication,
        therapy: isTherapy,
        visit: isVisit,
        patientId: sessionData.id,
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
          if (success.data.isEmpty) {
            consultation.value = Resource.empty();
            return;
          }
          consultation.value = Resource.success(success);
        },
      );
      return;
    }

    var data = await _consultationUseCases.getConsultationUseCase.execute(
      state: selectedState,
      pp: 99,
      medication: isMedication,
      therapy: isTherapy,
      visit: isVisit,
      patientId: patientHistorySettings!.patientId,
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
        if (success.data.isEmpty) {
          consultation.value = Resource.empty();
          return;
        }
        consultation.value = Resource.success(success);
      },
    );
  }

  void changeIndexTab(int index, ConsultationStatus state) {
    selectedIndex.value = index;
    selectedState = state;

    getConsultation();
    // onFetchPage();
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

    // onFetchPage();
    getConsultation();

    Get.back();
  }

  void onClearSearchText() {
    searchController.text = "";
  }
}
