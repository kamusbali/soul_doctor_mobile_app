import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';
import 'package:soul_doctor/app/core/infrastructure/sync/sync_service.dart';
import 'package:soul_doctor/main.dart';
import 'package:workmanager/workmanager.dart';

import 'app/core/infrastructure/config/app_config.dart';
import 'app/di/injection.dart';

void main() async {
  var config = AppConfig(environment: Environment.staging);

  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  await dotenv.load(fileName: config.environment.path);

  Injection.execute();

  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  await Hive.openBox('consultation');
  await Hive.openBox('consultation_detail');
  await Hive.openBox('visit_report');

  Workmanager().initialize(syncServiceStart);
  Workmanager().registerPeriodicTask(
    "sync-visit-report",
    "sync",
    frequency: Duration(minutes: 15),
    constraints: Constraints(networkType: NetworkType.connected),
  );

  await initializeDateFormatting("in_ID", null);

  runApp(MainApp());
}
