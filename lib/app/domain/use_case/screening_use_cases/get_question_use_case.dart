import 'package:soul_doctor/app/domain/model/screening_question.dart';
import 'package:soul_doctor/app/domain/repository/screening_repository.dart';

class GetQuestionUseCase {
  final ScreeningRepository _screeningRepository;

  GetQuestionUseCase(this._screeningRepository);

  List<ScreeningQuestion> execute() {
    return _screeningRepository.getQuestion();
  }
}
