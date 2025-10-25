import 'package:soul_doctor/app/domain/model/screening_question.dart';
import 'package:soul_doctor/app/domain/model/screening_score.dart';

class CalculateScreeningUseCase {
  ScreeningScore execute(Map<ScreeningQuestion, bool> answers) {
    double stressScore = 0;
    double anxietyScore = 0;
    double depressionScore = 0;
    double psychosisScore = 0;

    answers.forEach((question, answer) {
      if (ScreeningScore.stressQuestion.contains(question.id)) {
        stressScore += (answer ? 1 : 0);
      }

      if (ScreeningScore.anxietyQuestion.contains(question.id)) {
        anxietyScore += (answer ? 1 : 0);
      }

      if (ScreeningScore.depressionQuestion.contains(question.id)) {
        depressionScore += (answer ? 1 : 0);
      }

      if (ScreeningScore.psychosisQuestion.contains(question.id)) {
        psychosisScore += (answer ? 1 : 0);
      }
    });

    return ScreeningScore(
      stress: stressScore,
      anxiety: anxietyScore,
      depression: depressionScore,
      psychosis: psychosisScore,
    );
  }
}
