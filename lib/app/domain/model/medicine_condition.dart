enum MedicineCondition {
  enough,
  little,
  finished;

  int get id {
    switch (this) {
      case MedicineCondition.enough:
        return 1;
      case MedicineCondition.little:
        return 2;
      case MedicineCondition.finished:
        return 3;
    }
  }

  String get name {
    switch (this) {
      case MedicineCondition.enough:
        return "Cukup";
      case MedicineCondition.little:
        return "Sedikit";
      case MedicineCondition.finished:
        return "Habis";
    }
  }

  static MedicineCondition? getMedicineConditionFromId(int id) {
    switch (id) {
      case 1:
        return MedicineCondition.enough;
      case 2:
        return MedicineCondition.little;
      case 3:
        return MedicineCondition.finished;
      default:
        return null;
    }
  }
}
