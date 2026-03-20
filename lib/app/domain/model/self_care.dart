enum SelfCare {
  independent,
  assisted,
  rejected;

  int get id {
    switch (this) {
      case SelfCare.independent:
        return 1;
      case SelfCare.assisted:
        return 2;
      case SelfCare.rejected:
        return 3;
    }
  }

  String get name {
    switch (this) {
      case SelfCare.independent:
        return "Mandiri";
      case SelfCare.assisted:
        return "Dibantu";
      case SelfCare.rejected:
        return "Ditolak";
    }
  }

  static SelfCare? getSelfCareFromId(int id) {
    switch (id) {
      case 1:
        return SelfCare.independent;
      case 2:
        return SelfCare.assisted;
      case 3:
        return SelfCare.rejected;
      default:
        return null;
    }
  }
}
