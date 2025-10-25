import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/model/patient.dart';
import 'package:soul_doctor/app/domain/use_case/patient_use_cases/patient_use_cases.dart';

import '../../../common/resource.dart';

class PatientController extends GetxController {
  final PatientUseCases _patientUseCases;

  PatientController(this._patientUseCases);

  late TextEditingController searchController;

  final patient = Resource<List<Patient>>.none().obs;

  @override
  void onInit() {
    super.onInit();

    initialization();

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

  void initialization() {
    searchController = TextEditingController();
  }

  void getPatient() async {
    patient.value = Resource.loading();

    var data = await _patientUseCases.getPatientUseCase.execute();

    data.fold(
      (failure) {
        patient.value = Resource.error(failure.message);
      },
      (succes) {
        patient.value = Resource.success(succes);
      },
    );
  }
}
