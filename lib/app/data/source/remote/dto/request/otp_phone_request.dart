// To parse this JSON data, do
//
//     final registerRequest = registerRequestFromJson(jsonString);

import 'dart:convert';

OtpEmailRequest registerRequestFromJson(String str) =>
    OtpEmailRequest.fromJson(json.decode(str));

String registerRequestToJson(OtpEmailRequest data) =>
    json.encode(data.toJson());

class OtpEmailRequest {
  String? email;

  OtpEmailRequest({this.email});

  factory OtpEmailRequest.fromJson(Map<String, dynamic> json) =>
      OtpEmailRequest(email: json["email"]);

  Map<String, dynamic> toJson() => {"email": email};
}
