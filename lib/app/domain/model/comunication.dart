enum Comunication {
  good,
  less,
  disconected;

  int get id {
    switch (this) {
      case Comunication.good:
        return 1;
      case Comunication.less:
        return 2;
      case Comunication.disconected:
        return 3;
    }
  }

  String get name {
    switch (this) {
      case Comunication.good:
        return "Baik";
      case Comunication.less:
        return "Kurang";
      case Comunication.disconected:
        return "Tidak Nyambung";
    }
  }

  

  static Comunication? getComunicationFromId(int id) {
    switch (id) {
      case 1:
        return Comunication.good;
      case 2:
        return Comunication.less;
      case 3:
        return Comunication.disconected;
      default:
        return null;
    }
  }
}
