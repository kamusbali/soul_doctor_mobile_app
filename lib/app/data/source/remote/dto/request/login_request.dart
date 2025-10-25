// To parse this JSON data, do
//
//     final loginRequest = loginRequestFromJson(jsonString);

import 'dart:convert';

LoginRequest loginRequestFromJson(String str) =>
    LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  String? phone;
  String? pin;

  LoginRequest({this.phone, this.pin});

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      LoginRequest(phone: json["phone"], pin: json["pin"]);

  Map<String, dynamic> toJson() => {"phone": phone, "pin": pin};
}
