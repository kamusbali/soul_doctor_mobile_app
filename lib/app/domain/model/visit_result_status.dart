enum VisitResultStatus {
  worsening,
  gettingBetter,
  healed,
  curedWithMedicine,
  curedWithoutMedicine;

  int get id {
    switch (this) {
      case VisitResultStatus.worsening:
        return 1;
      case VisitResultStatus.gettingBetter:
        return 2;
      case VisitResultStatus.healed:
        return 3;
      case VisitResultStatus.curedWithMedicine:
        return 4;
      case VisitResultStatus.curedWithoutMedicine:
        return 5;
    }
  }

  String get name {
    switch (this) {
      case VisitResultStatus.worsening:
        return 'Memburuk';
      case VisitResultStatus.gettingBetter:
        return 'Membaik';
      case VisitResultStatus.healed:
        return 'Sembuh';
      case VisitResultStatus.curedWithMedicine:
        return 'Sembuh dengan Obat';
      case VisitResultStatus.curedWithoutMedicine:
        return 'Sembuh tanpa Obat';
    }
  }

  static VisitResultStatus? getVisitResultById(int id) {
    if (id == VisitResultStatus.worsening.id) {
      return VisitResultStatus.worsening;
    } else if (id == VisitResultStatus.gettingBetter.id) {
      return VisitResultStatus.gettingBetter;
    } else if (id == VisitResultStatus.healed.id) {
      return VisitResultStatus.healed;
    } else if (id == VisitResultStatus.curedWithMedicine.id) {
      return VisitResultStatus.curedWithMedicine;
    } else if (id == VisitResultStatus.curedWithoutMedicine.id) {
      return VisitResultStatus.curedWithoutMedicine;
    }

    return null;
  }
}
