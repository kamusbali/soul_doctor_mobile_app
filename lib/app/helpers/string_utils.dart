class StringUtils {
  static String maskPhoneNumber(String phone) {
    // Buang semua spasi dan tanda baca tidak penting
    String clean = phone.replaceAll(RegExp(r'[^0-9+]'), '');

    // Minimal harus punya +62 + 4 angka akhir
    if (clean.length <= 6) return clean;

    // Ambil 4 digit terakhir
    String last4 = clean.substring(clean.length - 4);

    // Sisanya kita convert jadi 'x'
    int maskLength = clean.length - last4.length;
    String masked = '+62${'x' * (maskLength - 3)}$last4';

    return masked;
  }
}
