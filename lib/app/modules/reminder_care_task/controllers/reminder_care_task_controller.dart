import 'package:get/get.dart';

import '../../../common/resource.dart';
import '../../../core/error/error_type.dart' show ErrorType;
import '../../../domain/model/reminder_care_task.dart';
import '../../../domain/model/session_data.dart';
import '../../../domain/use_case/auth_use_cases/auth_use_cases.dart';
import '../../../domain/use_case/reminder_care_task_use_cases/reminder_care_task_use_cases.dart';
import '../../../helpers/ui_feedback_utils.dart';
import '../../../routes/app_pages.dart';
import '../settings/reminder_care_task_settings.dart';

class ReminderCareTaskController extends GetxController {
  var arguments = Get.arguments as ReminderCareTaskSettings;

  final ReminderCareTaskUseCases _reminderCalendarUseCases;
  final AuthUseCases _authUseCases;

  ReminderCareTaskController(
    this._reminderCalendarUseCases,
    this._authUseCases,
  );

  var user = Resource<SessionData>.none().obs;

  var reminderCalendar = Resource<List<ReminderCareTask>>.none().obs;
  var markAsDoneReminderCareTaskState = Resource<bool>.none().obs;

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

  void initialize() async {
    await onGetProfileData();
    await fetchReminderCareTask();
  }

  Future<void> onGetProfileData() async {
    var sessionData = await _authUseCases.getSessionDataUseCases.execute();

    if (sessionData == null) {
      user.value = Resource.none();
      return;
    }

    user.value = Resource.success(sessionData);
  }

  Future<void> fetchReminderCareTask() async {
    reminderCalendar.value = Resource.loading();
    var reminderCareTaskResult = await _reminderCalendarUseCases
        .getReminderCareTasksUseCase
        .execute(patientId: arguments.patientId);

    reminderCareTaskResult.fold(
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
      (success) {
        reminderCalendar.value = Resource.success(success);
      },
    );
  }

  Future<void> markAsDoneReminderCareTask(String reminderId) async {
    markAsDoneReminderCareTaskState.value = Resource.loading();
    var markAsDoneResult = await _reminderCalendarUseCases
        .markAsDoneReminderCareTaskUseCase
        .execute(reminderId: reminderId);

    markAsDoneResult.fold(
      (failure) {
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
        markAsDoneReminderCareTaskState.value = Resource.error(failure.message);
      },
      (success) {
        fetchReminderCareTask();
        markAsDoneReminderCareTaskState.value = Resource.success(true);
      },
    );
  }
}
