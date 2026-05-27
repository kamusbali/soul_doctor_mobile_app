import 'package:get/get.dart';

import '../../../common/resource.dart';
import '../../../core/error/error_type.dart';
import '../../../domain/model/calendar_reminder.dart';
import '../../../domain/model/repeat_calendar_reminder.dart';
import '../../../domain/use_case/auth_use_cases/auth_use_cases.dart';
import '../../../domain/use_case/reminder_calendar_use_cases/reminder_calendar_use_cases.dart';
import '../../../helpers/ui_feedback_utils.dart';
import '../../../routes/app_pages.dart';

class ReminderCalendarController extends GetxController {
  final ReminderCalendarUseCases _reminderCalendarUseCases;
  final AuthUseCases _authUseCases;

  ReminderCalendarController(
    this._reminderCalendarUseCases,
    this._authUseCases,
  );

  var reminderCalendar = Resource<List<CalendarReminder>>.none().obs;

  var currentSelectedReminderCalendar = <CalendarReminder>[].obs;

  DateTime selectedDate = DateTime.now();

  @override
  void onInit() {
    super.onInit();

    initialize();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void initialize() {
    getReminderCalendar();
  }

  void getReminderCalendar() {
    reminderCalendar.value = Resource.loading();

    var data = _reminderCalendarUseCases.getAllReminderCalendarUseCase
        .execute();

    data.fold(
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
          reminderCalendar.value = Resource.error(failure.message);
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
        reminderCalendar.value = Resource.error(failure.message);
      },
      (succes) {
        print("Berhasil mendapatkan data reminder calendar: $succes");
        if (succes.isEmpty) {
          reminderCalendar.value = Resource.empty();
          currentSelectedReminderCalendar.value = [];
          return;
        }
        reminderCalendar.value = Resource.success(succes);
        currentSelectedReminderCalendar.value =
            succes.where((element) {
              if (element.repeatInterval == RepeatCalendarReminder.daily) {
                return true;
              } else if (element.repeatInterval ==
                  RepeatCalendarReminder.weekly) {
                return element.dateTime.weekday == selectedDate.weekday;
              } else if (element.repeatInterval ==
                  RepeatCalendarReminder.monthly) {
                return element.dateTime.day == selectedDate.day;
              }

              return element.dateTime.year == selectedDate.year &&
                  element.dateTime.month == selectedDate.month &&
                  element.dateTime.day == selectedDate.day;
            }).toList()..sort((a, b) {
              bool aDone = a.isDoneDateTime.any((doneDate) {
                return doneDate.year == selectedDate.year &&
                    doneDate.month == selectedDate.month &&
                    doneDate.day == selectedDate.day;
              });

              bool bDone = b.isDoneDateTime.any((doneDate) {
                return doneDate.year == selectedDate.year &&
                    doneDate.month == selectedDate.month &&
                    doneDate.day == selectedDate.day;
              });

              // yang belum done di atas
              if (aDone != bDone) {
                return aDone ? 1 : -1;
              }

              // sort berdasarkan jam
              return a.dateTime.compareTo(b.dateTime);
            });

        print(
          "Data reminder calendar yang sesuai dengan tanggal yang dipilih: ${currentSelectedReminderCalendar.value} dengan interval repeat ${currentSelectedReminderCalendar.map((e) => e.repeatInterval.name).toList()}",
        );
      },
    );
  }

  void onChangeDate(DateTime date) {
    selectedDate = date;
    getReminderCalendar();
  }

  void onChangeReminderStatus(CalendarReminder reminder, bool? isDone) async {
    var isDoneDateTime = reminder.isDoneDateTime;

    if (isDone == true) {
      isDoneDateTime.add(
        DateTime(selectedDate.year, selectedDate.month, selectedDate.day),
      );
    } else {
      isDoneDateTime.removeWhere(
        (dateTime) =>
            dateTime.year == selectedDate.year &&
            dateTime.month == selectedDate.month &&
            dateTime.day == selectedDate.day,
      );
    }

    var response = await _reminderCalendarUseCases.updateReminderCalendarUseCase
        .execute(
          id: reminder.id,
          title: reminder.title,
          description: reminder.description ?? "",
          dateTime: reminder.dateTime,
          repeatInterval: reminder.repeatInterval,
          isSynced: false,
          isDoneDateTime: isDoneDateTime,
        );

    response.fold(
      (failure) {
        UiFeedbackUtils.showSnackbar("Error", failure.message);
      },
      (success) {
        if (success) {
          getReminderCalendar();
          return;
        }

        UiFeedbackUtils.showSnackbar(
          "Error",
          "Gagal mengubah status pengingat",
        );
      },
    );
  }
}
