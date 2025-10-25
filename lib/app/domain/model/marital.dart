enum Marital {
  notMarried,
  married,
  divorce,
  divorceByDeath;

  int get id {
    switch (this) {
      case Marital.notMarried:
        return 1;
      case Marital.married:
        return 2;
      case Marital.divorce:
        return 3;
      case Marital.divorceByDeath:
        return 4;
    }
  }

  String get name {
    switch (this) {
      case Marital.notMarried:
        return "Belum Kawin";
      case Marital.married:
        return "Kawin";
      case Marital.divorce:
        return "Cerai Hidup";
      case Marital.divorceByDeath:
        return "Cerai Mati";
    }
  }

  static Marital? getMaritalFromId(int id) {
    if (Marital.notMarried.id == id) {
      return Marital.notMarried;
    } else if (Marital.married.id == id) {
      return Marital.married;
    } else if (Marital.divorce.id == id) {
      return Marital.divorce;
    } else if (Marital.divorceByDeath.id == id) {
      return Marital.divorceByDeath;
    } else {
      return null;
    }
  }
}
