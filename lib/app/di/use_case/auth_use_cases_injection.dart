import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/get_session_data_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/get_session_status_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/logout_use_case.dart';

class AuthUseCasesInjection {
  static void inject() {
    Get.lazyPut<GetSessionDataUseCases>(
      () => GetSessionDataUseCases(Get.find()),
      fenix: true,
    );
    Get.lazyPut<GetSessionStatusUseCase>(
      () => GetSessionStatusUseCase(Get.find()),
      fenix: true,
    );
    Get.lazyPut<LogoutUseCase>(() => LogoutUseCase(Get.find()), fenix: true);

    Get.lazyPut<AuthUseCases>(
      () => AuthUseCases(
        getSessionDataUseCases: Get.find(),
        getSessionStatusUseCase: Get.find(),
        logoutUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
