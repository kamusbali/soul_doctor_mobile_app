import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/create_request_consultation_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/get_compact_consultation_detail_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/get_consultation_detail_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/get_consultation_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/get_home_consultation_use_case.dart';

class ConsultationUseCases {
  final GetHomeConsultationUseCase getHomeConsultation;
  final GetConsultationUseCase getConsultationUseCase;
  final CreateRequestConsultationUseCase createRequestConsultationUseCase;
  final GetCompactConsultationDetailUseCase getCompactConsultationDetailUseCase;
  final GetConsultationDetailUseCase getConsultationDetailUseCase;

  ConsultationUseCases({
    required this.getHomeConsultation,
    required this.getConsultationUseCase,
    required this.createRequestConsultationUseCase,
    required this.getCompactConsultationDetailUseCase,
    required this.getConsultationDetailUseCase,
  });
}
