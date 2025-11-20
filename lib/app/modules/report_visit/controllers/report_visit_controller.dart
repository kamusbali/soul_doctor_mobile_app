import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/visit_use_cases/visit_use_cases.dart';
import 'package:soul_doctor/app/helpers/ui_feedback_utils.dart';
import 'package:soul_doctor/app/modules/report_visit/settings/report_visit_settings.dart';

import '../../../core/error/error_type.dart';
import '../../../routes/app_pages.dart';

class ReportVisitController extends GetxController {
  final VisitUseCases _visitUseCases;
  final AuthUseCases _authUseCases;

  ReportVisitController(this._visitUseCases, this._authUseCases);

  ReportVisitSettings reportVisitSettings = Get.arguments;

  var currentForm = 0.obs;

  final observation = TextEditingController();
  final cooperationController = TextEditingController();
  final mainDiseaseController = TextEditingController();
  final autoanamnesisController = TextEditingController();
  final diseaseHistoryController = TextEditingController();
  final familyHistoryController = TextEditingController();
  final heteroanamnesisController = TextEditingController();
  final medicationHistoryController = TextEditingController();
  final psychiatricStatusController = TextEditingController();

  final historyPatientFormKey = GlobalKey<FormState>();
  final observationFormKey = GlobalKey<FormState>();

  RxList<XFile> pictures = <XFile>[].obs;

  var addReportStatus = Resource<bool>.none().obs;

  @override
  void onInit() {
    super.onInit();

    if (reportVisitSettings.isHasData) {
      onChangeCurrentForm(1);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onClearPicture() {}

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

  void onDeletePicture(int index) {
    pictures.removeAt(index);
  }

  Future getImages({ImageSource imageSource = ImageSource.gallery}) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile;

    switch (imageSource) {
      case ImageSource.camera:
        var status = await Permission.camera.request();
        if (status.isGranted) {
          pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
        }
        break;
      case ImageSource.gallery:
        var status = await Permission.mediaLibrary.request();
        if (status.isGranted) {
          pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
        }

        break;
    }

    if (pickedFile != null) {
      pictures.add(pickedFile);
      // picture.value = pickedFile;
      // pictureController.text = picture.value.path;
    }
    Get.back();
  }

  void onChangeCurrentForm(int value) {
    if (value == 1 && !reportVisitSettings.isHasData) {
      if (!historyPatientFormKey.currentState!.validate()) {
        UiFeedbackUtils.showSnackbar(
          "Data Riwayat Tidak Lengkap",
          "Silahkan lengkapi data riwayat!",
        );
        return;
      }
    }

    currentForm.value = value;
  }

  void onSendVisitReportData() async {
    if (!observationFormKey.currentState!.validate()) {
      UiFeedbackUtils.showSnackbar(
        "Data Riwayat Tidak Lengkap",
        "Silahkan lengkapi data riwayat!",
      );
      return;
    }

    addReportStatus.value = Resource.loading();
    var response = await _visitUseCases.reportVolunteerUseCase.execute(
      visitId: reportVisitSettings.visitId,
      observation: observation.text,
      cooperation: reportVisitSettings.isHasData
          ? null
          : cooperationController.text,
      mainDisease: reportVisitSettings.isHasData
          ? null
          : mainDiseaseController.text,
      autoanamnesis: reportVisitSettings.isHasData
          ? null
          : autoanamnesisController.text,
      diseaseHistory: reportVisitSettings.isHasData
          ? null
          : diseaseHistoryController.text,
      familyHistory: reportVisitSettings.isHasData
          ? null
          : familyHistoryController.text,
      heteroanamnesis: reportVisitSettings.isHasData
          ? null
          : heteroanamnesisController.text,
      medicationHistory: reportVisitSettings.isHasData
          ? null
          : medicationHistoryController.text,
      psychiatricStatus: reportVisitSettings.isHasData
          ? null
          : psychiatricStatusController.text,
      images: pictures.isEmpty ? null : pictures,
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
          addReportStatus.value = Resource.error(failure.message);
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
        addReportStatus.value = Resource.error(failure.message);
      },
      (success) {
        if (!success) {
          if (Get.isDialogOpen != true) {
            UiFeedbackUtils.showDialog(
              title: "Terjadi Kesalahan",
              body: "Tidak dapat menambah report visit",
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
          body: "Sukses menambah report visit",
          primaryButtonText: "Okay",
          onPrimaryPressed: () {
            Get.back();
            Get.offAllNamed(Routes.VOLUNTEER_WRAPPER);
          },
        );
        addReportStatus.value = Resource.success(success);
      },
    );
  }
}
