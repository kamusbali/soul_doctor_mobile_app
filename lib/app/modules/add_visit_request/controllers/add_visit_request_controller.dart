import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:soul_doctor/app/domain/model/consultation_type.dart';
import 'package:soul_doctor/app/domain/model/patient.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/consultation_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/patient_use_cases/patient_use_cases.dart';

import '../../../common/resource.dart';
import '../../../helpers/ui_feedback_utils.dart';

class AddVisitRequestController extends GetxController {
  final ConsultationUseCases _consultationUseCases;
  final PatientUseCases _patientUseCases;

  AddVisitRequestController(this._consultationUseCases, this._patientUseCases);

  Patient? selectedPatient;
  Rx<String?> selectedPatientErrorText = (null as String?).obs;
  final patientController = TextEditingController();

  // ConsultationType? selectedConsultationType;
  // Rx<String?> selectedConsultationTypeErrorText = (null as String?).obs;
  // final consultationTypeController = TextEditingController();

  final symptomController = TextEditingController();
  final startDateController = TextEditingController();
  final pictureController = TextEditingController();

  DateTime? selectedStartDate;

  final picture = XFile('').obs;

  var addConsultationState = Resource<bool>.none().obs;

  final formKey = GlobalKey<FormState>();

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

  void onAddConsultation() async {
    if (symptomController.text.isEmpty &&
        selectedStartDate == null &&
        startDateController.text.isEmpty &&
        selectedPatient == null &&
        // selectedConsultationType == null &&
        !formKey.currentState!.validate()) {
      if (selectedPatient == null) {
        selectedPatientErrorText.value = "Pasien tidak boleh kosong";
      }

      // if (selectedConsultationType == null) {
      //   selectedConsultationTypeErrorText.value =
      //       "Jenis Konsultasi tidak boleh kosong";
      // }
      UiFeedbackUtils.showSnackbar(
        "Data belom lengkap",
        "Silahkan lengkapi form sebelum mengajukan konsultasi!",
      );

      return;
    }

    addConsultationState.value = Resource.loading();

    var response = await _consultationUseCases.createRequestConsultationUseCase
        .execute(
          patientId: selectedPatient!.id,
          symptom: symptomController.text,
          startDate: selectedStartDate!,
          image: picture.value.path == "" ? null : picture.value,
          type: ConsultationType.consultation,
        );

    response.fold(
      (failure) {
        addConsultationState.value = Resource.error(failure.message);
        UiFeedbackUtils.showSnackbar("Error", failure.message);
      },
      (success) {
        if (success) {
          addConsultationState.value = Resource.success(success);
          UiFeedbackUtils.showDialog(
            title: "Sukses",
            body: "Sukses membuat pengajuan konsultas",
            primaryButtonText: "Okay",
            onPrimaryPressed: () {
              Get.back();
              Get.back();
            },
          );
          return;
        }

        addConsultationState.value = Resource.error(
          "Gagal membuat pengajuan konsultasi",
        );

        UiFeedbackUtils.showSnackbar(
          "Error",
          "Gagal membuat pengajuan konsultasi",
        );
      },
    );
  }

  void onSelectStartDate() async {
    final pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null) {
      selectedStartDate = pickedDate;
      startDateController.text = DateFormat(
        "dd-MM-yyyy",
      ).format(pickedDate).toString();
    }
  }

  void onClearPicture() {
    picture.value = XFile("");
  }

  void onAddPicture() {
    UiFeedbackUtils.showDialog(
      title: "Pilih Foto",
      body: "Anda dapat memilih foto anda di galery ataupun lewat kamera",
      primaryButtonText: "Galeri",
      onPrimaryPressed: () async {
        await getImages(imageSource: ImageSource.gallery);
      },
      secondaryButtonText: "Kamera",
      onSecondaryPressed: () async {
        await getImages(imageSource: ImageSource.camera);
      },
    );
  }

  Future getImages({ImageSource imageSource = ImageSource.gallery}) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile;

    switch (imageSource) {
      case ImageSource.camera:
        pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
      case ImageSource.gallery:
        pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    }

    if (pickedFile != null) {
      picture.value = pickedFile;
      pictureController.text = picture.value.path;
    }
    Get.back();
  }

  void onChangeSelectedPatient(Patient patient) {
    selectedPatient = patient;
  }

  Future<List<Patient>> getPatient() async {
    var response = await _patientUseCases.getPatientUseCase.execute();

    List<Patient> patients = [];

    response.fold(
      (failure) {
        throw Exception(failure.message);
      },
      (success) {
        patients = success;
      },
    );

    return patients;
  }

  // void onChangeSelectedConsultationType(ConsultationType consultationType) {
  //   selectedConsultationType = consultationType;
  // }
}
