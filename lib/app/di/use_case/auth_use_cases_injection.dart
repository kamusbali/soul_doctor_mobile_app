import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/create_pin_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/get_session_data_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/get_session_status_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/login_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/logout_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/register_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/update_pin_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/verify_otp_use_case.dart';

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

    Get.lazyPut<LoginUseCase>(() => LoginUseCase(Get.find()), fenix: true);

    Get.lazyPut<RegisterUseCase>(
      () => RegisterUseCase(Get.find()),
      fenix: true,
    );
    Get.lazyPut<VerifyOtpUseCase>(
      () => VerifyOtpUseCase(Get.find()),
      fenix: true,
    );

    Get.lazyPut<CreatePinUseCase>(
      () => CreatePinUseCase(Get.find()),
      fenix: true,
    );

    Get.lazyPut<UpdatePinUseCase>(
      () => UpdatePinUseCase(Get.find()),
      fenix: true,
    );

    Get.lazyPut<AuthUseCases>(
      () => AuthUseCases(
        getSessionDataUseCases: Get.find(),
        getSessionStatusUseCase: Get.find(),
        logoutUseCase: Get.find(),
        loginUseCase: Get.find(),
        registerUseCase: Get.find(),
        verifyOtpUseCase: Get.find(),
        createPinUseCase: Get.find(),
        updatePinUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
