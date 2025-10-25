enum Religion {
  islam,
  kristenProtestan,
  kristenKatolik,
  hindu,
  buddha,
  konghucu,
  believers;

  int get id {
    switch (this) {
      case Religion.islam:
        return 1;
      case Religion.kristenProtestan:
        return 2;
      case Religion.kristenKatolik:
        return 3;
      case Religion.hindu:
        return 4;
      case Religion.buddha:
        return 5;
      case Religion.konghucu:
        return 6;
      case Religion.believers:
        return 7;
    }
  }

  String get name {
    switch (this) {
      case Religion.islam:
        return "Islam";
      case Religion.kristenProtestan:
        return "Kristen Protestan";

      case Religion.kristenKatolik:
        return "Kristen Katolik";

      case Religion.hindu:
        return "Hindu";

      case Religion.buddha:
        return "Buddha";

      case Religion.konghucu:
        return "Konghucu";

      case Religion.believers:
        return "Penghayat Kepercayaan";
    }
  }

  static Religion? getReligionFromId(int id) {
    if (Religion.islam.id == id) {
      return Religion.islam;
    } else if (Religion.kristenProtestan.id == id) {
      return Religion.kristenProtestan;
    } else if (Religion.kristenKatolik.id == id) {
      return Religion.kristenKatolik;
    } else if (Religion.hindu.id == id) {
      return Religion.hindu;
    } else if (Religion.buddha.id == id) {
      return Religion.buddha;
    } else if (Religion.konghucu.id == id) {
      return Religion.konghucu;
    } else if (Religion.believers.id == id) {
      return Religion.believers;
    } else {
      return null;
    }
  }
}
