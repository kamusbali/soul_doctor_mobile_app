import 'package:dio/dio.dart';
import 'package:soul_doctor/app/data/source/local/provider/sync_provider_data.dart';
import 'package:soul_doctor/app/data/source/remote/provider/visit_provider.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void syncServiceStart() {
  Workmanager().executeTask((task, inputData) async {
    SyncProviderData syncProviderData = SyncProviderData.instance;

    VisitProvider visitProvider = VisitProvider();
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
            );
          }
        }
      },
    );

    return Future.value(true);
  });
}
