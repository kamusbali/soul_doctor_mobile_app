// To parse this JSON data, do
//
//     final loginRequest = loginRequestFromJson(jsonString);

import 'dart:convert';

LoginRequest loginRequestFromJson(String str) =>
    LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  String? email;
  String? pin;

  LoginRequest({this.email, this.pin});

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      LoginRequest(email: json["email"], pin: json["pin"]);

  Map<String, dynamic> toJson() => {"email": email, "pin": pin};
}
