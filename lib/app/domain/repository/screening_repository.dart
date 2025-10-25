import '../model/screening_question.dart';

abstract class ScreeningRepository {
  List<ScreeningQuestion> getQuestion();
}
