import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:soul_doctor/app/domain/use_case/reminder_care_task_use_cases/reminder_care_task_use_cases.dart';

import '../../../common/resource.dart';
import '../../../domain/model/patient.dart';
import '../../../domain/use_case/patient_use_cases/patient_use_cases.dart';
import '../../../helpers/ui_feedback_utils.dart';
import '../settings/add_edit_reminder_care_task_settings.dart';

class AddEditReminderCareTaskController extends GetxController {
  AddEditReminderCareTaskSettings addEditReminderCalendarSettings =
      Get.arguments;

  final ReminderCareTaskUseCases _reminderCareTaskUseCases;
  final PatientUseCases _patientUseCases;

  AddEditReminderCareTaskController(
    this._reminderCareTaskUseCases,
    this._patientUseCases,
  );

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final frequencyPerDayController = TextEditingController();
  final dateTimeStartController = TextEditingController();
  final dateTimeEndController = TextEditingController();

  DateTime? selectedDateTimeStart;
  DateTime? selectedDateTimeEnd;

  Patient? selectedPatient;
  Rx<String?> selectedPatientErrorText = (null as String?).obs;
  final patientController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  var addEditReminderCareTaskState = Resource<bool>.none().obs;

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

  void onSelectStartDateTime() async {
    final pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null) {
      selectedDateTimeStart = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
      );

      dateTimeStartController.text = DateFormat(
        "dd-MM-yyyy",
      ).format(selectedDateTimeStart!).toString();
    }
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

  void onSelectEndDateTime() async {
    final pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null) {
      selectedDateTimeEnd = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
      );

      dateTimeEndController.text = DateFormat(
        "dd-MM-yyyy",
      ).format(selectedDateTimeEnd!).toString();
    }
  }

  void onAddReminderCareTask() async {
    if (titleController.text.isEmpty &&
        selectedDateTimeStart == null &&
        selectedDateTimeEnd == null &&
        descriptionController.text.isEmpty &&
        frequencyPerDayController.text.isEmpty &&
        dateTimeStartController.text.isEmpty &&
        !formKey.currentState!.validate()) {
      UiFeedbackUtils.showSnackbar(
        "Data belom lengkap",
        "Silahkan lengkapi form sebelum menambah Tugas Perawatan!",
      );

      return;
    }

    addEditReminderCareTaskState.value = Resource.loading();

    var response = await _reminderCareTaskUseCases.createReminderCareTaskUseCase
        .execute(
          title: titleController.text,
          description: descriptionController.text,
          patientId: selectedPatient!.id,
          startDate: selectedDateTimeStart!,
          endDate: selectedDateTimeEnd!,
          frequency: int.parse(frequencyPerDayController.text),
        );

    response.fold(
      (failure) {
        addEditReminderCareTaskState.value = Resource.error(failure.message);
        UiFeedbackUtils.showSnackbar("Error", failure.message);
      },
      (success) {
        addEditReminderCareTaskState.value = Resource.success(true);
        UiFeedbackUtils.showDialog(
          title: "Sukses",
          body: "Sukses membuat Tugas Perawatan",
          primaryButtonText: "Okay",
          onPrimaryPressed: () {
            Get.back();
            Get.back();
          },
        );
      },
    );
  }
}
