enum AfterSleepCondition {
  fresh,
  weak,
  normal;

  int get id {
    switch (this) {
      case AfterSleepCondition.fresh:
        return 1;
      case AfterSleepCondition.weak:
        return 2;
      case AfterSleepCondition.normal:
        return 3;
    }
  }

  String get name {
    switch (this) {
      case AfterSleepCondition.fresh:
        return "Segar";
      case AfterSleepCondition.weak:
        return "Lemas";
      case AfterSleepCondition.normal:
        return "Biasa Saja";
    }
  }

  static AfterSleepCondition? getAfterSleepConditionFromId(int id) {
    switch (id) {
      case 1:
        return AfterSleepCondition.fresh;
      case 2:
        return AfterSleepCondition.weak;
      case 3:
        return AfterSleepCondition.normal;
      default:
        return null;
    }
  }
}
