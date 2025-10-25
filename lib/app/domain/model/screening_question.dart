class ScreeningQuestion {
  int id;
  String question;

  ScreeningQuestion({required this.id, required this.question});

  @override
  String toString() {
    return id.toString();
  }
}
