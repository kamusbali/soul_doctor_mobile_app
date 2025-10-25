import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/model/screening_question.dart';
import 'package:soul_doctor/app/domain/use_case/screening_use_cases/screening_use_cases.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';

import '../../../common/resource.dart';

class AssessmentQuestionController extends GetxController  {
  final ScreeningUseCases _screeningUseCases;

  AssessmentQuestionController(this._screeningUseCases);

  List<ScreeningQuestion> questions = [];
  List<bool?> answers = [];

  var currentQuestion = 0.obs;
  var selectedAnswerIndex = (-1).obs;

  final questionState = Resource<bool>.none().obs;

  @override
  void onInit() {
    super.onInit();

    getInitialization();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onResetQuestion() => selectedAnswerIndex.value = -1;

  void onChangeSelectedAnswerIndex(int index) =>
      selectedAnswerIndex.value = index;

  void onNextQuestion() {
    if (selectedAnswerIndex.value == -1) {
      questionState.value = Resource.error("Tolong jawab pertanyaan");
      return;
    }

    answers[currentQuestion.value] = selectedAnswerIndex.value == 1
        ? true
        : selectedAnswerIndex.value == 0
        ? false
        : null;

    print(answers);

    if (currentQuestion.value + 1 >= questions.length) {
      if (answers.contains(null)) {
        questionState.value = Resource.error("Tolong jawab semua pertanyaan");
        return;
      }

      Map<ScreeningQuestion, bool> data = {};

      for (var i = 0; i < questions.length; i++) {
        data[questions[i]] = answers[i]!;
      }

      var result = _screeningUseCases.calculateScreeningUseCase.execute(data);

      Get.offNamed(Routes.ASSESSMENT_RESULT, arguments: result);

      return;
    }

    currentQuestion.value += 1;
    onResetQuestion();
    getCurrentAnswer();
  }

  void onBackQuestion() {
    if (currentQuestion.value <= 0) {
      questionState.value = Resource.error("Ini adalah pertanyaan pertama");
      return;
    }
    currentQuestion.value -= 1;
    getCurrentAnswer();
  }

  void getInitialization() {
    questions = _screeningUseCases.getQuestionUseCase.execute();
    answers = List.generate(questions.length, (index) => null);
  }

  void getCurrentAnswer() {
    var data = answers[currentQuestion.value];

    if (data == true) {
      selectedAnswerIndex.value = 1;
      return;
    }
    if (data == false) {
      selectedAnswerIndex.value = 0;
      return;
    }

    selectedAnswerIndex.value = -1;
  }
}
