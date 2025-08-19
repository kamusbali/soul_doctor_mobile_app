import '../../common/constant/const_path.dart';

enum Environment {
  development,
  production,
  staging;

  String get path {
    switch (this) {
      case Environment.development:
        return ConstPath.DEVELOPMENT_PATH;
      case Environment.production:
        return ConstPath.PRODUCTION_PATH;
      case Environment.staging:
        return ConstPath.STAGING_PATH;
    }
  }
}

class AppConfig {
  Environment environment;

  AppConfig({required this.environment});
}