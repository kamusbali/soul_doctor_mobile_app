import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/use_case/volunteer_use_cases/get_volunteer_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/volunteer_use_cases/volunteer_use_cases.dart';

class VolunteerUseCasesInjection {
  static void inject() {
    Get.lazyPut<GetVolunteerUseCase>(
      () => GetVolunteerUseCase(Get.find()),
      fenix: true,
    );

    Get.lazyPut<VolunteerUseCases>(
      () => VolunteerUseCases(getVolunteerUseCase: Get.find()),
      fenix: true,
    );
  }
}
