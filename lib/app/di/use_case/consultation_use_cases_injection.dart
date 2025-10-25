import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/consultation_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/create_request_consultation_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/get_compact_consultation_detail_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/get_consultation_detail_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/get_consultation_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/get_home_consultation_use_case.dart';

class ConsultationUseCasesInjection {
  static void inject() {
    Get.lazyPut<GetHomeConsultationUseCase>(
      () => GetHomeConsultationUseCase(Get.find()),
      fenix: true,
    );

    Get.lazyPut<GetConsultationUseCase>(
      () => GetConsultationUseCase(Get.find()),
      fenix: true,
    );

    Get.lazyPut<CreateRequestConsultationUseCase>(
      () => CreateRequestConsultationUseCase(Get.find()),
      fenix: true,
    );

    Get.lazyPut<GetCompactConsultationDetailUseCase>(
      () => GetCompactConsultationDetailUseCase(Get.find()),
      fenix: true,
    );

    Get.lazyPut<GetConsultationDetailUseCase>(
      () => GetConsultationDetailUseCase(Get.find()),
      fenix: true,
    );

    Get.lazyPut<ConsultationUseCases>(
      () => ConsultationUseCases(
        getHomeConsultation: Get.find(),
        getConsultationUseCase: Get.find(),
        createRequestConsultationUseCase: Get.find(),
        getCompactConsultationDetailUseCase: Get.find(),
        getConsultationDetailUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
