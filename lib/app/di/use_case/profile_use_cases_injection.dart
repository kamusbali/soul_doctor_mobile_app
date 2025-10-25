import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/use_case/profile_use_cases/get_compact_profile_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/profile_use_cases/get_profile_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/profile_use_cases/profile_use_cases.dart';

class ProfileUseCasesInjection {
  static void inject() {
    Get.lazyPut<GetCompactProfileUseCase>(
      () => GetCompactProfileUseCase(Get.find()),
      fenix: true,
    );
    Get.lazyPut<GetProfileUseCase>(
      () => GetProfileUseCase(Get.find()),
      fenix: true,
    );

    Get.lazyPut<ProfileUseCases>(
      () => ProfileUseCases(
        getCompactProfileUseCase: Get.find(),
        getProfileUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
