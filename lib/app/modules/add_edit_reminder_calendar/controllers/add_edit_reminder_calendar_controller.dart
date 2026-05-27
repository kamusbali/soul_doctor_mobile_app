import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/resource.dart';
import '../../../domain/model/repeat_calendar_reminder.dart';
import '../../../domain/use_case/reminder_calendar_use_cases/reminder_calendar_use_cases.dart';
import '../../../helpers/ui_feedback_utils.dart';
import '../settings/add_edit_reminder_calendar_settings.dart';

class AddEditReminderCalendarController extends GetxController {
  AddEditReminderCalendarSettings addEditReminderCalendarSettings =
      Get.arguments;

  final ReminderCalendarUseCases _reminderCalendarUseCases;

  AddEditReminderCalendarController(this._reminderCalendarUseCases);

  final titleController = TextEditingController();
  final dateTimeController = TextEditingController();
  final descriptionController = TextEditingController();

  RepeatCalendarReminder? selectedRepeatInterval;
  final TextEditingController repeatIntervalController =
      TextEditingController();
  Rx<String?> repeatIntervalErrorText = (null as String?).obs;

  DateTime? selectedDateTime;

  final formKey = GlobalKey<FormState>();

  var addEditReminderCalendarState = Resource<bool>.none().obs;

  @override
  void onInit() {
    super.onInit();

    onSetCurrentData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onChangeRepeatIntervalValue(RepeatCalendarReminder repeatInterval) {
    selectedRepeatInterval = repeatInterval;
  }

  void onSetCurrentData() {
    if (addEditReminderCalendarSettings.calendarReminder != null) {
      var calendarReminder = addEditReminderCalendarSettings.calendarReminder!;
      titleController.text = calendarReminder.title;
      descriptionController.text = calendarReminder.description ?? "";
      selectedDateTime = calendarReminder.dateTime;
      dateTimeController.text = DateFormat(
        "dd-MM-yyyy HH:mm",
      ).format(calendarReminder.dateTime);
      selectedRepeatInterval = calendarReminder.repeatInterval;
      repeatIntervalController.text = selectedRepeatInterval!.name;
    }
  }

  void onSelectDateTime() async {
    final pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    final pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );

    if (pickedDate != null && pickedTime != null) {
      selectedDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      dateTimeController.text = DateFormat(
        "dd-MM-yyyy HH:mm",
      ).format(selectedDateTime!).toString();
    }
  }

  void onAddReminderCalendar() async {
    if (titleController.text.isEmpty &&
        selectedDateTime == null &&
        dateTimeController.text.isEmpty &&
        !formKey.currentState!.validate()) {
      UiFeedbackUtils.showSnackbar(
        "Data belom lengkap",
        "Silahkan lengkapi form sebelum menambah pengingat!",
      );

      return;
    }

    addEditReminderCalendarState.value = Resource.loading();

    var response = await _reminderCalendarUseCases.addReminderCalendarUseCase
        .execute(
          title: titleController.text,
          description: descriptionController.text,
          dateTime: selectedDateTime!,
          repeatInterval: selectedRepeatInterval ?? RepeatCalendarReminder.none,
          isDoneDateTime: [],
        );

    response.fold(
      (failure) {
        addEditReminderCalendarState.value = Resource.error(failure.message);
        UiFeedbackUtils.showSnackbar("Error", failure.message);
      },
      (success) {
        if (success) {
          addEditReminderCalendarState.value = Resource.success(success);
          UiFeedbackUtils.showDialog(
            title: "Sukses",
            body: "Sukses membuat pengingat",
            primaryButtonText: "Okay",
            onPrimaryPressed: () {
              Get.back();
              Get.back();
            },
          );
          return;
        }

        addEditReminderCalendarState.value = Resource.error(
          "Gagal membuat pengingat",
        );

        UiFeedbackUtils.showSnackbar("Error", "Gagal membuat pengingat");
      },
    );
  }

  void onEditReminderCalendar() async {
    if (titleController.text.isEmpty &&
        selectedDateTime == null &&
        dateTimeController.text.isEmpty &&
        !formKey.currentState!.validate()) {
      // if (selectedConsultationType == null) {
      //   selectedConsultationTypeErrorText.value =
      //       "Jenis Konsultasi tidak boleh kosong";
      // }
      UiFeedbackUtils.showSnackbar(
        "Data belom lengkap",
        "Silahkan lengkapi form sebelum mengedit pengingat!",
      );

      return;
    }

    addEditReminderCalendarState.value = Resource.loading();

    var response = await _reminderCalendarUseCases.updateReminderCalendarUseCase
        .execute(
          id: addEditReminderCalendarSettings.calendarReminder!.id,
          title: titleController.text,
          description: descriptionController.text,
          dateTime: selectedDateTime!,
          repeatInterval:
              selectedRepeatInterval ??
              addEditReminderCalendarSettings.calendarReminder!.repeatInterval,
          isDoneDateTime:
              addEditReminderCalendarSettings.calendarReminder!.isDoneDateTime,
          isSynced: addEditReminderCalendarSettings.calendarReminder!.isSynced,
        );

    response.fold(
      (failure) {
        addEditReminderCalendarState.value = Resource.error(failure.message);
        UiFeedbackUtils.showSnackbar("Error", failure.message);
      },
      (success) {
        if (success) {
          addEditReminderCalendarState.value = Resource.success(success);
          UiFeedbackUtils.showDialog(
            title: "Sukses",
            body: "Sukses mengedit pengingat",
            primaryButtonText: "Okay",
            onPrimaryPressed: () {
              Get.back();
              Get.back();
            },
          );
          return;
        }

        addEditReminderCalendarState.value = Resource.error(
          "Gagal mengedit pengingat",
        );

        UiFeedbackUtils.showSnackbar("Error", "Gagal mengedit pengingat");
      },
    );
  }

  void onDeleteReminderCalendar() async {
    UiFeedbackUtils.showDialog(
      title: "Anda yakin ingin menghapus pengingat ini?",
      body: "Tindakan ini tidak dapat dibatalkan",
      primaryButtonText: "Okay",
      secondaryButtonText: "Batal",
      onPrimaryPressed: () async {
        Get.back();
        addEditReminderCalendarState.value = Resource.loading();

        var response = await _reminderCalendarUseCases
            .deleteReminderCalendarUseCase
            .execute(addEditReminderCalendarSettings.calendarReminder!.id);

        response.fold(
          (failure) {
            addEditReminderCalendarState.value = Resource.error(
              failure.message,
            );
            UiFeedbackUtils.showSnackbar("Error", failure.message);
          },
          (success) {
            if (success) {
              addEditReminderCalendarState.value = Resource.success(success);
              UiFeedbackUtils.showDialog(
                title: "Sukses",
                body: "Sukses menghapus pengingat",
                primaryButtonText: "Okay",
                onPrimaryPressed: () {
                  Get.back();
                  Get.back();
                },
              );
              return;
            }

            addEditReminderCalendarState.value = Resource.error(
              "Gagal menghapus pengingat",
            );

            UiFeedbackUtils.showSnackbar("Error", "Gagal menghapus pengingat");
          },
        );
      },
    );
  }
}
