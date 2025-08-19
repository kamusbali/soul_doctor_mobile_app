abstract class Dummy {
  static String photoProfile([int? number]) =>
      "https://avatar.iran.liara.run/public/${number?.toString() ?? "boy"}";
}
