
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:soul_doctor/main.dart';

import 'app/core/infrastructure/app_config.dart';
import 'app/di/injection.dart';

void main() async {
  var config = AppConfig(environment: Environment.staging);

  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: config.environment.path);

  Injection.execute();

  runApp(MainApp());
}