import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/use_case/screening_use_cases/calculate_screening_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/screening_use_cases/get_question_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/screening_use_cases/screening_use_cases.dart';

class ScreeningUseCasesInjection {
  static void inject() {
    Get.lazyPut<GetQuestionUseCase>(
      () => GetQuestionUseCase(Get.find()),
      fenix: true,
    );
    Get.lazyPut<CalculateScreeningUseCase>(
      () => CalculateScreeningUseCase(),
      fenix: true,
    );

    Get.lazyPut<ScreeningUseCases>(
      () => ScreeningUseCases(
        getQuestionUseCase: Get.find(),
        calculateScreeningUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
