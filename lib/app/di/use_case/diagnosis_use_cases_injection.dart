import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/use_case/diagnosis_use_cases/create_diagnosis_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/diagnosis_use_cases/diagnosis_use_cases.dart';

class DiagnosisUseCasesInjection {
  static void inject() {
    Get.lazyPut<CreateDiagnosisUseCase>(
      () => CreateDiagnosisUseCase(Get.find()),
      fenix: true,
    );

    Get.lazyPut<DiagnosisUseCases>(
      () => DiagnosisUseCases(createDiagnosisUseCase: Get.find()),
      fenix: true,
    );
  }
}
