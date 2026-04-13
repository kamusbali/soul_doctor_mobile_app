import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:soul_doctor/app/domain/model/patient.dart';
import 'package:soul_doctor/app/domain/use_case/daily_report_use_cases/daily_report_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/patient_use_cases/patient_use_cases.dart';
import 'package:soul_doctor/app/modules/report_daily/settings/report_daily_settings.dart';

import '../../../common/resource.dart';
import '../../../core/error/error_type.dart';
import '../../../domain/model/after_sleep_condition.dart';
import '../../../domain/model/comunication.dart';
import '../../../domain/model/medicine_condition.dart' show MedicineCondition;
import '../../../domain/model/pemuput_upacara.dart';
import '../../../domain/model/self_care.dart';
import '../../../domain/model/visit_result_status.dart';
import '../../../domain/use_case/auth_use_cases/auth_use_cases.dart';
import '../../../helpers/ui_feedback_utils.dart';
import '../../../routes/app_pages.dart';

class ReportDailyController extends GetxController {
  final DailyReportUseCases _dailyReportUseCases;
  final AuthUseCases _authUseCases;
  final PatientUseCases _patientUseCases;

  ReportDailyController(
    this._dailyReportUseCases,
    this._authUseCases,
    this._patientUseCases,
  );

  ReportDailySettings reportDailySettings = Get.arguments;

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

  final sleepHourController = TextEditingController();

  Patient? selectedPatient;
  Rx<String?> selectedPatientErrorText = (null as String?).obs;
  final patientController = TextEditingController();

  VisitResultStatus? selectedVisitResultStatus;
  final TextEditingController visitResultStatusController =
      TextEditingController();
  Rx<String?> visitResultStatusErrorText = (null as String?).obs;

  AfterSleepCondition? selectedAfterSleepCondition;
  final TextEditingController afterSleepConditionController =
      TextEditingController();
  Rx<String?> afterSleepConditionErrorText = (null as String?).obs;

  MedicineCondition? selectedMedicineCondition;
  final TextEditingController medicineConditionController =
      TextEditingController();
  Rx<String?> medicineConditionErrorText = (null as String?).obs;

  Comunication? selectedComunication;
  final TextEditingController comunicationController = TextEditingController();
  Rx<String?> comunicationErrorText = (null as String?).obs;

  SelfCare? selectedSelfCare;
  final TextEditingController selfCareController = TextEditingController();
  Rx<String?> selfCareErrorText = (null as String?).obs;

  bool? selectedDoingCeremony;
  final TextEditingController doingCeremonyController = TextEditingController();
  Rx<String?> doingCeremonyErrorText = (null as String?).obs;

  final TextEditingController ceremonyNameController = TextEditingController();

  PemuputUpacara? selectedPemuputUpacara;
  final TextEditingController pemuputUpacaraController =
      TextEditingController();
  Rx<String?> pemuputUpacaraErrorText = (null as String?).obs;

  bool? selectedSideEffect;
  final TextEditingController sideEffectController = TextEditingController();
  Rx<String?> sideEffectErrorText = (null as String?).obs;

  final historyPatientFormKey = GlobalKey<FormState>();
  final observationFormKey = GlobalKey<FormState>();

  RxList<XFile> pictures = <XFile>[].obs;

  var addReportStatus = Resource<bool>.none().obs;

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
    if (value == 1) {
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
    if (!observationFormKey.currentState!.validate() ||
        (selectedSideEffect == null) ||
        (selectedVisitResultStatus == null) ||
        (selectedAfterSleepCondition == null) ||
        (selectedMedicineCondition == null) ||
        (selectedComunication == null) ||
        (selectedSelfCare == null) ||
        (selectedDoingCeremony == null) ||
        (selectedDoingCeremony == true &&
            (selectedPemuputUpacara == null ||
                ceremonyNameController.text.isEmpty))) {
      UiFeedbackUtils.showSnackbar(
        "Data Riwayat Tidak Lengkap",
        "Silahkan lengkapi data riwayat!",
      );
      return;
    }

    addReportStatus.value = Resource.loading();
    var response = await _dailyReportUseCases.reportDailyUseCase.execute(
      patientId: reportDailySettings.patientId != null
          ? reportDailySettings.patientId!
          : selectedPatient!.id,
      observation: observation.text,
      cooperation: cooperationController.text,
      mainDisease: mainDiseaseController.text,
      autoanamnesis: autoanamnesisController.text,
      diseaseHistory: diseaseHistoryController.text,
      familyHistory: familyHistoryController.text,
      heteroanamnesis: heteroanamnesisController.text,
      medicationHistory: medicationHistoryController.text,
      psychiatricStatus: psychiatricStatusController.text,
      images: pictures.isEmpty ? null : pictures,
      sideEffect: selectedSideEffect!,
      resultStatusId: selectedVisitResultStatus!,
      sleepHour: int.tryParse(sleepHourController.text)!,
      afterSleepCondition: selectedAfterSleepCondition!,
      medicineCondition: selectedMedicineCondition!,
      communication: selectedComunication!,
      selfCare: selectedSelfCare!,
      doingCeremony: selectedDoingCeremony!,
      ceremonyName: ceremonyNameController.text.isEmpty
          ? null
          : ceremonyNameController.text,
      pemuputUpcara: selectedPemuputUpacara,
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
            if (reportDailySettings.patientId == null) {
              Get.offAllNamed(Routes.CAREGIVER_WRAPPER);
              return;
            }
            Get.offAllNamed(Routes.PATIENT_WRAPPER);
          },
        );
        addReportStatus.value = Resource.success(success);
      },
    );
  }

  void onChangeVisitResultStatusValue(VisitResultStatus visitResultStatus) {
    selectedVisitResultStatus = visitResultStatus;
  }

  void onChangeAfterSleepConditionValue(
    AfterSleepCondition afterSleepCondition,
  ) {
    selectedAfterSleepCondition = afterSleepCondition;
  }

  void onChangeMedicineConditionValue(MedicineCondition medicineCondition) {
    selectedMedicineCondition = medicineCondition;
  }

  void onChangeComunicationValue(Comunication comunication) {
    selectedComunication = comunication;
  }

  void onChangeSelfCareValue(SelfCare selfCare) {
    selectedSelfCare = selfCare;
  }

  void onChangeDoingCeremonyValue(bool doingCeremony) {
    selectedDoingCeremony = doingCeremony;
  }

  void onChangePemuputUpacaraValue(PemuputUpacara pemuputUpacara) {
    selectedPemuputUpacara = pemuputUpacara;
  }

  void onChangeSideEffect(bool sideEffect) {
    selectedSideEffect = sideEffect;
  }

  void onChangePatient(Patient patient) {
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

  void onChangeSelectedPatient(Patient patient) {
    selectedPatient = patient;
  }
}
