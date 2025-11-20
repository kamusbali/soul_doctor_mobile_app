import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/model/volunteer.dart';
import 'package:soul_doctor/app/domain/use_case/visit_use_cases/visit_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/volunteer_use_cases/volunteer_use_cases.dart';
import 'package:soul_doctor/app/modules/visit_schedule_form/settings/visit_schedule_form_settings.dart';

import '../../../helpers/ui_feedback_utils.dart';

class VisitScheduleFormController extends GetxController {
  final VolunteerUseCases _volunteerUseCases;
  final VisitUseCases _visitUseCases;

  VisitScheduleFormController(this._volunteerUseCases, this._visitUseCases);

  VisitScheduleFormSettings visitScheduleFormSettings = Get.arguments;

  Volunteer? selectedVolunteer;
  Rx<String?> selectedVolunteerErrorText = (null as String?).obs;
  final volunteerController = TextEditingController();

  final notesController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  var assignVolunteerState = Resource<bool>.none().obs;

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

  void onChangeSelectedVolunteer(Volunteer volunteer) {
    selectedVolunteer = volunteer;
  }

  Future<List<Volunteer>> getVolunteer() async {
    var response = await _volunteerUseCases.getVolunteerUseCase.execute();

    List<Volunteer> volunteer = [];

    response.fold(
      (failure) {
        throw Exception(failure.message);
      },
      (success) {
        List<Volunteer> volunteerTemp = [];
        volunteerTemp = success;

        if (visitScheduleFormSettings.visitorRejection != null) {
          volunteerTemp.removeWhere(
            (volunteer) =>
                volunteer.name ==
                visitScheduleFormSettings.visitorRejection!.name,
          );
        }

        volunteer = success;
      },
    );

    return volunteer;
  }

  void onAssignVisitToVolunteer() async {
    if (!formKey.currentState!.validate() || selectedVolunteer == null) {
      if (selectedVolunteer == null) {
        selectedVolunteerErrorText.value = "Volunteer tidak boleh kosong";
        print("Here");
      }

      UiFeedbackUtils.showSnackbar(
        "Data belom lengkap",
        "Silahkan lengkapi form sebelum mengajukan konsultasi!",
      );

      return;
    }

    assignVolunteerState.value = Resource.loading();

    var response = await _visitUseCases.assignVolunteerUseCase.execute(
      consultationId: visitScheduleFormSettings.id,
      volunteerId: selectedVolunteer!.id,
      note: notesController.text,
    );

    response.fold(
      (failure) {
        assignVolunteerState.value = Resource.error(failure.message);
        UiFeedbackUtils.showSnackbar("Error", failure.message);
      },
      (success) {
        if (success) {
          assignVolunteerState.value = Resource.success(success);
          UiFeedbackUtils.showDialog(
            title: "Sukses",
            body: "Sukses membuat menjadwalkan visit",
            primaryButtonText: "Okay",
            onPrimaryPressed: () {
              Get.back();
              Get.back();
              Get.back();
            },
          );
          return;
        }

        assignVolunteerState.value = Resource.error(
          "Gagal membuat pengajuan konsultasi",
        );

        UiFeedbackUtils.showSnackbar(
          "Error",
          "Gagal membuat pengajuan konsultasi",
        );
      },
    );
  }
}
