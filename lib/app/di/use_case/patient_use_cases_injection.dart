import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/use_case/patient_use_cases/create_patient_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/patient_use_cases/get_patient_detail_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/patient_use_cases/get_patient_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/patient_use_cases/patient_use_cases.dart';

class PatientUseCasesInjection {
  static void inject() {
    Get.lazyPut<GetPatientUseCase>(
      () => GetPatientUseCase(Get.find()),
      fenix: true,
    );
    Get.lazyPut<CreatePatientUseCase>(
      () => CreatePatientUseCase(Get.find()),
      fenix: true,
    );

    Get.lazyPut<GetPatientDetailUseCase>(
      () => GetPatientDetailUseCase(Get.find()),
      fenix: true,
    );

    Get.lazyPut<PatientUseCases>(
      () => PatientUseCases(
        getPatientUseCase: Get.find(),
        createPatientUseCase: Get.find(),
        getPatientDetailUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
