import 'package:soul_doctor/app/domain/model/screening_question.dart';

class ScreeningProvider {
  List<ScreeningQuestion> getQuestion() {
    return [
      ScreeningQuestion(
        id: 1,
        question: "Saya cenderung bereaksi berlebihan terhadap suatu situasi.",
      ),
      ScreeningQuestion(
        id: 2,
        question:
            "Saya merasa khawatir dengan situasi dimana saya mungkin menjadi panik dan cemas",
      ),
      ScreeningQuestion(
        id: 3,
        question:
            "Saya merasa tidak ada hal yang dapat diharapkan di masa depan.",
      ),
      ScreeningQuestion(id: 4, question: "Saya merasa sulit untuk bersantai."),
      ScreeningQuestion(id: 5, question: "Saya merasa sedih dan putus asa"),
      ScreeningQuestion(
        id: 6,
        question: "Saya merasa bahwa saya mudah tersinggung.",
      ),
      ScreeningQuestion(
        id: 7,
        question: "Saya merasa detak jantung meningkat atau berdebar-debar",
      ),
      ScreeningQuestion(
        id: 8,
        question: "Saya merasa takut tanpa alasan yang jelas.",
      ),
      ScreeningQuestion(
        id: 9,
        question: "Saya merasa bahwa hidup tidak bermanfaat.",
      ),
      ScreeningQuestion(
        id: 10,
        question:
            "Saya kesulitan mengucapkan kata-kata yang ingin saya katakan",
      ),
      ScreeningQuestion(
        id: 11,
        question:
            "Saya melihat atau mendengar hal-hal yang tidak dapat dilihat atau didengar orang lain",
      ),
      ScreeningQuestion(
        id: 12,
        question:
            "Saya pikir orang lain terkadang dapat membaca pikiran saya, atau saya dapat membaca pikiran orang lain",
      ),
    ];
  }
}
