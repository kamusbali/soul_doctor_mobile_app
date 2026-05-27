import 'package:dio/dio.dart';
import 'package:soul_doctor/app/data/source/local/provider/sync_provider_data.dart';
import 'package:soul_doctor/app/data/source/remote/provider/visit_provider.dart';
import 'package:workmanager/workmanager.dart';

import '../../../data/source/local/provider/reminder_calendar_local_provider.dart';
import '../../../data/source/remote/provider/reminder_calendar_provider.dart';

@pragma('vm:entry-point')
void syncServiceStart() {
  Workmanager().executeTask((task, inputData) async {
    SyncProviderData syncProviderData = SyncProviderData.instance;
    ReminderCalendarLocalProvider reminderCalendarLocalProvider =
        ReminderCalendarLocalProvider.instance;

    VisitProvider visitProvider = VisitProvider();
    ReminderCalendarProvider reminderCalendarProvider =
        ReminderCalendarProvider();

    var dataStatus = syncProviderData.getVisitReport();

    dataStatus.fold(
      (failure) {
        return Future.value(false);
      },
      (success) {
        if (success.isNotEmpty) {
          for (var data in success) {
            visitProvider.reportVisit(
              visitId: data.visitId ?? "",
              observation: data.observation ?? "",
              cooperation: data.cooperation,
              mainDisease: data.mainDisease,
              autoanamnesis: data.autoanamnesis,
              diseaseHistory: data.diseaseHistory,
              familyHistory: data.familyHistory,
              heteroanamnesis: data.heteroanamnesis,
              medicationHistory: data.medicationHistory,
              psychiatricStatus: data.psychiatricStatus,
              images: data.images
                  ?.map((data) => MultipartFile.fromBytes(data))
                  .toList(),
              sideEffect: data.sideEffect ?? false,
              resultStatusId: data.resultStatusId ?? 1,
            );
          }
        }
      },
    );
    var reminderCalendarData = reminderCalendarLocalProvider
        .getAllReminderCalendarData();

    reminderCalendarData.fold(
      (failure) {
        return Future.value(false);
      },
      (success) {
        if (success.isNotEmpty) {
          for (var data in success) {
            if (data.isSynced == false) {
              reminderCalendarProvider.addDataToServer(
                json: data.toJson().toString(),
                time: data.dateTime ?? DateTime.now(),
              );
              reminderCalendarLocalProvider.updateReminderCalendarData(
                id: data.id ?? "",
                title: data.title ?? "",
                description: data.description ?? "",
                dateTime: data.dateTime ?? DateTime.now(),
                isSynced: true,
                repeatInterval: data.repeatInterval ?? 0,
                isDoneDateTime: data.isDoneDateTime ?? [],
              );
            }
          }
        }
      },
    );

    return Future.value(true);
  });
}
