class ScreeningScore {
  double stress;
  double anxiety;
  double depression;
  double psychosis;

  static List<int> stressQuestion = [1, 4, 6];
  static List<int> anxietyQuestion = [2, 7, 8];
  static List<int> depressionQuestion = [3, 5, 9];
  static List<int> psychosisQuestion = [10, 11, 12];

  ScreeningScore({
    required this.stress,
    required this.anxiety,
    required this.depression,
    required this.psychosis,
  });
}
