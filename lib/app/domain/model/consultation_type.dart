enum ConsultationType {
  consultation,
  help;

  String get name {
    switch (this) {
      case ConsultationType.consultation:
        return "Konsultasi";
      case ConsultationType.help:
        return "Bantuan";
    }
  }

  int get id {
    switch (this) {
      case ConsultationType.consultation:
        return 1;
      case ConsultationType.help:
        return 2;
    }
  }

  static ConsultationType? getConsultationTypeById(int id) {
    if (id == ConsultationType.consultation.id) {
      return ConsultationType.consultation;
    } else if (id == ConsultationType.help.id) {
      return ConsultationType.help;
    }
    return null;
  }
}
