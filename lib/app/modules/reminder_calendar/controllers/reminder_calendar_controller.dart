import 'package:get/get.dart';

import '../../../common/resource.dart';
import '../../../core/error/error_type.dart';
import '../../../domain/model/calendar_reminder.dart';
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
          return;
        }
        reminderCalendar.value = Resource.success(succes);
        currentSelectedReminderCalendar.value = succes.where((element) {
          return element.dateTime.year == selectedDate.year &&
              element.dateTime.month == selectedDate.month &&
              element.dateTime.day == selectedDate.day;
        }).toList();

        print(
          "Data reminder calendar yang sesuai dengan tanggal yang dipilih: ${currentSelectedReminderCalendar.value}",
        );
      },
    );
  }

  void onChangeDate(DateTime date) {
    selectedDate = date;
    getReminderCalendar();
  }
}
