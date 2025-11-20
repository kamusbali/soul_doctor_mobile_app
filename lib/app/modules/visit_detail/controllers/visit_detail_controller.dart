import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/model/consultation_detail.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/consultation_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/visit_use_cases/visit_use_cases.dart';
import 'package:soul_doctor/app/helpers/ui_feedback_utils.dart';
import 'package:soul_doctor/app/modules/visit_detail/settings/visit_detail_settings.dart';

import '../../../core/error/error_type.dart';
import '../../../routes/app_pages.dart';

class VisitDetailController extends GetxController {
  final ConsultationUseCases _consultationUseCases;
  final AuthUseCases _authUseCases;
  final VisitUseCases _visitUseCases;

  VisitDetailController(
    this._consultationUseCases,
    this._authUseCases,
    this._visitUseCases,
  );

  VisitDetailSettings visitDetailSettings = Get.arguments;

  var visitDataStatus = Resource<ConsultationDetail>.none().obs;

  var acceptVisitStatus = Resource<bool>.none().obs;
  var rejectVisitStatus = Resource<bool>.none().obs;

  final reasonController = TextEditingController();
  Rx<String?> reasonErrorText = (null as String?).obs;

  @override
  void onInit() {
    super.onInit();
    onGetVisitData();

    print(visitDetailSettings.isFirstVisit);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onGetVisitData() async {
    visitDataStatus.value = Resource.loading();
    var response = await _consultationUseCases.getConsultationDetailUseCase
        .execute(visitDetailSettings.id);

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
          visitDataStatus.value = Resource.error(failure.message);
          return;
        }

        if (Get.isDialogOpen != true) {
          UiFeedbackUtils.showDialog(
            title: "Terjadi Kesalahan",
            body: failure.message,
            primaryButtonText: "Okay",
            onPrimaryPressed: () {
              Get.back();
            },
          );
        }
        visitDataStatus.value = Resource.error(failure.message);
      },
      (success) {
        visitDataStatus.value = Resource.success(success);
      },
    );
  }

  void onAcceptVisit() async {
    final bool isConnected = await InternetConnection().hasInternetAccess;

    if (!isConnected) {
      if (Get.isDialogOpen != true) {
        UiFeedbackUtils.showDialog(
          title: "Tidak ada internet",
          body:
              "Silahkan cari tempat yang memiliki internet untuk menerima/menolak visit",
          onPrimaryPressed: () {
            Get.back();
            Get.back();
          },
          primaryButtonText: "Okay",
        );
      }
      return;
    }

    acceptVisitStatus.value = Resource.loading();

    if (visitDataStatus.value.status == Status.success &&
        visitDataStatus.value.data != null &&
        visitDataStatus.value.data?.currentVisit != null) {
      var response = await _visitUseCases.acceptVisitUseCase.execute(
        visitId: visitDataStatus.value.data!.currentVisit!.visitId,
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
            acceptVisitStatus.value = Resource.error(failure.message);
            return;
          }

          if (Get.isDialogOpen != true) {
            UiFeedbackUtils.showDialog(
              title: "Terjadi Kesalahan",
              body: failure.message,
              primaryButtonText: "Okay",
              onPrimaryPressed: () {
                Get.back();
              },
            );
          }
          acceptVisitStatus.value = Resource.error(failure.message);
        },
        (success) {
          if (!success) {
            if (Get.isDialogOpen != true) {
              UiFeedbackUtils.showDialog(
                title: "Terjadi Kesalahan",
                body: "Tidak dapat menerima visit",
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
            body: "Sukses menerima visit",
            primaryButtonText: "Okay",
            onPrimaryPressed: () {
              Get.back();
              Get.back();
            },
          );
          acceptVisitStatus.value = Resource.success(success);
        },
      );
    }
    if (Get.isDialogOpen != true) {
      UiFeedbackUtils.showDialog(
        title: "Terjadi Kesalahan",
        body: "Data visit tidak ada",
        primaryButtonText: "Okay",
        onPrimaryPressed: () {
          Get.back();
        },
      );
    }
  }

  void onRejectVisit() async {
    final bool isConnected = await InternetConnection().hasInternetAccess;

    if (!isConnected) {
      if (Get.isDialogOpen != true) {
        UiFeedbackUtils.showDialog(
          title: "Tidak ada internet",
          body:
              "Silahkan cari tempat yang memiliki internet untuk menerima/menolak visit",
          onPrimaryPressed: () {
            Get.back();
            Get.back();
          },
          primaryButtonText: "Okay",
        );
      }
      return;
    }

    if (reasonController.text.isEmpty) {
      reasonErrorText.value = "Alasan tidak boleh kosong";
      return;
    }

    if (visitDataStatus.value.status == Status.success &&
        visitDataStatus.value.data != null &&
        visitDataStatus.value.data?.currentVisit != null) {
      Get.back();
      acceptVisitStatus.value = Resource.loading();

      var response = await _visitUseCases.rejectVisitUseCase.execute(
        visitId: visitDataStatus.value.data!.currentVisit!.visitId,
        reason: reasonController.text,
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
            acceptVisitStatus.value = Resource.error(failure.message);
            return;
          }

          if (Get.isDialogOpen != true) {
            UiFeedbackUtils.showDialog(
              title: "Terjadi Kesalahan",
              body: failure.message,
              primaryButtonText: "Okay",
              onPrimaryPressed: () {
                Get.back();
              },
            );
          }
          acceptVisitStatus.value = Resource.error(failure.message);
        },
        (success) {
          if (!success) {
            if (Get.isDialogOpen != true) {
              UiFeedbackUtils.showDialog(
                title: "Terjadi Kesalahan",
                body: "Tidak dapat menerima visit",
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
            body: "Sukses menolak visit",
            primaryButtonText: "Okay",
            onPrimaryPressed: () {
              Get.back();
              Get.back();
            },
          );
          acceptVisitStatus.value = Resource.success(success);
        },
      );
    }
    if (Get.isDialogOpen != true) {
      UiFeedbackUtils.showDialog(
        title: "Terjadi Kesalahan",
        body: "Data visit tidak ada",
        primaryButtonText: "Okay",
        onPrimaryPressed: () {
          Get.back();
        },
      );
    }
  }
}
