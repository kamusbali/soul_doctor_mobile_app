import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:soul_doctor/app/domain/use_case/patient_use_cases/patient_use_cases.dart';

import '../../../common/resource.dart';
import '../../../domain/model/education.dart';
import '../../../domain/model/gender.dart';
import '../../../domain/model/marital.dart';
import '../../../domain/model/religion.dart';
import '../../../helpers/ui_feedback_utils.dart';

class CreatePatientController extends GetxController {
  final PatientUseCases _patientUseCases;

  CreatePatientController(this._patientUseCases);

  final formKey = GlobalKey<FormState>();

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  DateTime? selectedDateTime;
  final TextEditingController dateTimeController = TextEditingController();

  Gender? selectedGender;
  final TextEditingController genderController = TextEditingController();
  Rx<String?> genderErrorText = (null as String?).obs;

  Marital? selectedMarital;
  final TextEditingController maritalController = TextEditingController();
  Rx<String?> maritalErrorText = (null as String?).obs;

  Education? selectedEducation;
  final TextEditingController educationController = TextEditingController();
  Rx<String?> educationErrorText = (null as String?).obs;

  final TextEditingController jobController = TextEditingController();

  Religion? selectedReligion;
  final TextEditingController religionController = TextEditingController();
  Rx<String?> religionErrorText = (null as String?).obs;

  final TextEditingController addressController = TextEditingController();

  var inputProfileStatus = Resource<bool>.none().obs;

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

  void onChangeGenderValue(Gender gender) {
    selectedGender = gender;
  }

  void onChangeMaritalValue(Marital marital) {
    selectedMarital = marital;
  }

  void onChangeEducationValue(Education education) {
    selectedEducation = education;
  }

  void onChaneReligionValue(Religion religion) {
    selectedReligion = religion;
  }

  void onCreatePatient() async {
    if (selectedGender == null &&
        selectedMarital == null &&
        selectedDateTime == null &&
        selectedEducation == null &&
        selectedReligion == null &&
        !formKey.currentState!.validate()) {
      if (selectedGender == null) {
        genderErrorText.value = "Jenis kelamin tidak boleh kosong";
      }
      if (selectedMarital == null) {
        maritalErrorText.value = "Status perkawinan tidak boleh kosong";
      }
      if (selectedEducation == null) {
        educationErrorText.value = "Pendidikan tidak boleh kosong";
      }
      if (selectedReligion == null) {
        religionErrorText.value = "Agama tidak boleh kosong";
      }
      UiFeedbackUtils.showSnackbar("Lengkapi!", "Tolong lengkapi semua data!");
      return;
    }
    inputProfileStatus.value = Resource.loading();
    var response = await _patientUseCases.createPatientUseCase.execute(
      fullname: fullnameController.text,
      nickname: nicknameController.text,
      phone: phoneController.text,
      email: emailController.text,
      birthday: selectedDateTime!,
      gender: selectedGender!,
      maritalStatusId: selectedMarital!,
      lastEducationId: selectedEducation!,
      job: jobController.text,
      religionId: selectedReligion!,
      address: addressController.text,
    );

    response.fold(
      (failure) {
        UiFeedbackUtils.showSnackbar("Error", failure.message);
        inputProfileStatus.value = Resource.error(failure.message);
      },
      (success) {
        inputProfileStatus.value = Resource.success(success);
        UiFeedbackUtils.showDialog(
          title: "Sukses",
          body: "Data berhasil di input, silahkan anda dapat melanjutkan!",
          primaryButtonText: "Oke",
          onPrimaryPressed: () {
            if (Get.isDialogOpen == true) {
              Get.back();
            }

            if (Navigator.of(Get.context!).canPop()) {
              Get.back();
              return;
            }
          },
          barrierDismissible: false,
        );
      },
    );
  }

  Future<void> onSelectDateBirth() async {
    final pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null) {
      selectedDateTime = pickedDate;
      dateTimeController.text = DateFormat(
        "yyyy-MM-dd",
      ).format(pickedDate).toString();
    }
  }
}
