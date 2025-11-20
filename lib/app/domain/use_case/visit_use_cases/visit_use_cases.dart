import 'package:soul_doctor/app/domain/use_case/visit_use_cases/accept_visit_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/visit_use_cases/assign_volunteer_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/visit_use_cases/reject_visit_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/visit_use_cases/report_volunteer_use_case.dart';

class VisitUseCases {
  AssignVolunteerUseCase assignVolunteerUseCase;
  AcceptVisitUseCase acceptVisitUseCase;
  RejectVisitUseCase rejectVisitUseCase;
  ReportVolunteerUseCase reportVolunteerUseCase;

  VisitUseCases({
    required this.assignVolunteerUseCase,
    required this.acceptVisitUseCase,
    required this.rejectVisitUseCase,
    required this.reportVolunteerUseCase,
  });
}
