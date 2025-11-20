import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/use_case/visit_use_cases/accept_visit_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/visit_use_cases/assign_volunteer_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/visit_use_cases/reject_visit_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/visit_use_cases/report_volunteer_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/visit_use_cases/visit_use_cases.dart';

class VisitUseCasesInjection {
  static void inject() {
    Get.lazyPut<AssignVolunteerUseCase>(
      () => AssignVolunteerUseCase(Get.find()),
      fenix: true,
    );

    Get.lazyPut<RejectVisitUseCase>(
      () => RejectVisitUseCase(Get.find()),
      fenix: true,
    );
    Get.lazyPut<AcceptVisitUseCase>(
      () => AcceptVisitUseCase(Get.find()),
      fenix: true,
    );
    Get.lazyPut<ReportVolunteerUseCase>(
      () => ReportVolunteerUseCase(Get.find()),
      fenix: true,
    );

    Get.lazyPut<VisitUseCases>(
      () => VisitUseCases(
        assignVolunteerUseCase: Get.find(),
        acceptVisitUseCase: Get.find(),
        rejectVisitUseCase: Get.find(),
        reportVolunteerUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
