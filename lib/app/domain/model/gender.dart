enum Gender {
  male,
  female;

  String get name {
    switch (this) {
      case Gender.male:
        return "Laki-laki";
      case Gender.female:
        return "Perempuan";
    }
  }

  bool get value {
    switch (this) {
      case Gender.male:
        return true;
      case Gender.female:
        return false;
    }
  }

  static Gender getGenderByValue(bool value) {
    if (value) {
      return Gender.male;
    } else {
      return Gender.female;
    }
  }
}
