// To parse this JSON data, do
//
//     final registerRequest = registerRequestFromJson(jsonString);

import 'dart:convert';

OtpPhoneRequest registerRequestFromJson(String str) =>
    OtpPhoneRequest.fromJson(json.decode(str));

String registerRequestToJson(OtpPhoneRequest data) =>
    json.encode(data.toJson());

class OtpPhoneRequest {
  String? phone;

  OtpPhoneRequest({this.phone});

  factory OtpPhoneRequest.fromJson(Map<String, dynamic> json) =>
      OtpPhoneRequest(phone: json["phone"]);

  Map<String, dynamic> toJson() => {"phone": phone};
}
