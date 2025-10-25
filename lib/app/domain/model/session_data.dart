import 'dart:convert';

import 'package:soul_doctor/app/domain/model/role.dart';

class SessionData {
  String id;
  String fullname;
  String nickname;
  Role role;
  DateTime iat;

  SessionData({
    required this.id,
    required this.fullname,
    required this.nickname,
    required this.role,
    required this.iat,
  });

  factory SessionData.fromToken(String token) {
    String normalizedSource = base64Url.normalize(token.split(".")[1]);
    var data = jsonDecode(utf8.decode(base64Url.decode(normalizedSource)));

    return SessionData(
      id: data["id"],
      fullname: data["fullname"],
      nickname: data["nickname"],
      role: Role.getRoleById(data["role"]) ?? Role.patient,
      iat: DateTime.fromMillisecondsSinceEpoch(data["iat"] * 1000),
    );
  }

  factory SessionData.fromJson(Map<String, dynamic> json) {
    return SessionData(
      id: json["id"],
      fullname: json["fullname"],
      nickname: json["nickname"],
      role: Role.getRoleById(json["role"]) ?? Role.patient,
      iat: DateTime.fromMillisecondsSinceEpoch(json["iat"] * 1000),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullname": fullname,
    "nickname": nickname,
    "role": role.id,
    "iat": iat.millisecondsSinceEpoch,
  };
}
