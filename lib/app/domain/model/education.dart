enum Education {
  noSchool,
  elementarySchool,
  juniorHighSchool,
  seniorHighSchool,
  diploma,
  bachelor,
  master,
  doctoral;

  int get id {
    switch (this) {
      case Education.noSchool:
        return 1;
      case Education.elementarySchool:
        return 2;
      case Education.juniorHighSchool:
        return 3;
      case Education.seniorHighSchool:
        return 4;
      case Education.diploma:
        return 5;
      case Education.bachelor:
        return 6;
      case Education.master:
        return 7;
      case Education.doctoral:
        return 8;
    }
  }

  String get name {
    switch (this) {
      case Education.noSchool:
        return "Tidak Sekolah";
      case Education.elementarySchool:
        return "SD/Sederajat";
      case Education.juniorHighSchool:
        return "SMP/Sederajat";
      case Education.seniorHighSchool:
        return "SMA/Sederajat";
      case Education.diploma:
        return "Diploma";
      case Education.bachelor:
        return "Sarjana";
      case Education.master:
        return "Magister";
      case Education.doctoral:
        return "Doktoral";
    }
  }

  static Education? getEducationFromId(int id) {
    if (Education.noSchool.id == id) {
      return Education.noSchool;
    } else if (Education.elementarySchool.id == id) {
      return Education.elementarySchool;
    } else if (Education.juniorHighSchool.id == id) {
      return Education.juniorHighSchool;
    } else if (Education.seniorHighSchool.id == id) {
      return Education.seniorHighSchool;
    } else if (Education.diploma.id == id) {
      return Education.diploma;
    } else if (Education.bachelor.id == id) {
      return Education.bachelor;
    } else if (Education.master.id == id) {
      return Education.master;
    } else if (Education.doctoral.id == id) {
      return Education.doctoral;
    } else {
      return null;
    }
  }
}
