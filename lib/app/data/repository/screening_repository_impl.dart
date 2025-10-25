import 'package:soul_doctor/app/data/source/static/provider.dart/screening_provider.dart';
import 'package:soul_doctor/app/domain/model/screening_question.dart';
import 'package:soul_doctor/app/domain/repository/screening_repository.dart';

class ScreeningRepositoryImpl implements ScreeningRepository {
  final ScreeningProvider _screeningProvider;

  ScreeningRepositoryImpl(this._screeningProvider);

  @override
  List<ScreeningQuestion> getQuestion() {
    return _screeningProvider.getQuestion();
  }
}
