import 'package:soul_doctor/app/domain/use_case/screening_use_cases/calculate_screening_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/screening_use_cases/get_question_use_case.dart';

class ScreeningUseCases {
  final CalculateScreeningUseCase calculateScreeningUseCase;
  final GetQuestionUseCase getQuestionUseCase;

  ScreeningUseCases({
    required this.calculateScreeningUseCase,
    required this.getQuestionUseCase,
  });
}
