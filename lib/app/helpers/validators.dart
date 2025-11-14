import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Validators {
  static String? onEmailValidation(String? value) {
    if (onNotEmptyValidation(value, "Email") != null) {
      return onNotEmptyValidation(value, "Email");
    }

    if (!GetUtils.isEmail(value!)) {
      return "Tolong masukkan email yang bener";
    }
    return null;
  }

  static String? onPinValidation(String? value) {
    if (onNotEmptyValidation(value, "Pin") != null) {
      return onNotEmptyValidation(value, "Pin");
    }

    if (value!.length != 6) {
      return "Password tidak boleh kurang dari 8 karakter";
    }
    return null;
  }

  static String? onNotEmptyValidation(String? value, String label) {
    if (value == null || value.isEmpty) {
      return "$label tidak boleh kosong";
    }
    return null;
  }

  static String? onNumberValidation(String? value) {
    if (onNotEmptyValidation(value, "Number") != null) {
      return onNotEmptyValidation(value, "Email");
    }

    if (!GetUtils.isPhoneNumber(value!)) {
      return "Tolong masukkan nomor yang benar";
    }

    return null;
  }

  static String? onIntValidation(String? value, String label) {
    if (onNotEmptyValidation(value, label) != null) {
      return onNotEmptyValidation(value, label);
    }

    if (!GetUtils.isNum(value!)) {
      return "Tolong masukkan angka";
    }

    return null;
  }

  static String? onPinRepeatValidation(String? value, String pin) {
    if (onNotEmptyValidation(value, "Pin") != null) {
      return onNotEmptyValidation(value, "Pin");
    }

    if (!GetUtils.isNum(value!)) {
      return "Pin Harus angka";
    }

    if (value.length != 6) {
      return "Pin harus memiliki panjang 6";
    }

    if (value != pin) {
      return "Pin tidak sesuai";
    }

    return null;
  }

  static String? onCheckDateAfter(String? value, String label) {
    try {
      final DateTime selectedDateTime = DateFormat(
        'dd/MM/yyyy hh:mm a',
      ).parse(value ?? "");

      if (selectedDateTime.isBefore(DateTime.now())) {
        return "$label tidak boleh di masa lalu";
      }
      return null;
    } on FormatException catch (e) {
      return e.message;
    }
  }
}
