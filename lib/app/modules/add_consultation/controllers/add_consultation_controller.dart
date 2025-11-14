import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/consultation_use_cases.dart';
import 'package:soul_doctor/app/helpers/ui_feedback_utils.dart';

class AddConsultationController extends GetxController {
  final ConsultationUseCases _consultationUseCases;
  final AuthUseCases _authUseCases;

  AddConsultationController(this._consultationUseCases, this._authUseCases);

  final symptomController = TextEditingController();
  final startDateController = TextEditingController();
  final pictureController = TextEditingController();

  DateTime? selectedStartDate;

  final picture = XFile('').obs;

  var addConsultationState = Resource<bool>.none().obs;

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

  void onSelectDateBirth() async {
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

  void onAddConsultation() async {
    addConsultationState.value = Resource.loading();
    var sessionData = await _authUseCases.getSessionDataUseCases.execute();
    
    if (sessionData == null) {
      UiFeedbackUtils.showSnackbar(
        "Tidak ada sesi",
        "Tidak ada sesi yang disimpan, silahkan login kembali!",
      );
      return;
    }
    if (symptomController.text.isEmpty &&
        selectedStartDate == null &&
        startDateController.text.isEmpty) {
      UiFeedbackUtils.showSnackbar(
        "Data belom lengkap",
        "Silahkan lengkapi form sebelum mengajukan konsultasi!",
      );

      return;
    }

    var response = await _consultationUseCases.createRequestConsultationUseCase
        .execute(
          patientId: sessionData.id,
          symptom: symptomController.text,
          startDate: selectedStartDate!,
          image: picture.value.path == "" ? null : picture.value,
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
}
