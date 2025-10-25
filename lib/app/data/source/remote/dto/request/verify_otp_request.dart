// To parse this JSON data, do
//
//     final verifyOtpRequest = verifyOtpRequestFromJson(jsonString);

import 'dart:convert';

VerifyOtpRequest verifyOtpRequestFromJson(String str) =>
    VerifyOtpRequest.fromJson(json.decode(str));

String verifyOtpRequestToJson(VerifyOtpRequest data) =>
    json.encode(data.toJson());

class VerifyOtpRequest {
  String? transactionId;
  String? otp;

  VerifyOtpRequest({this.transactionId, this.otp});

  factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) =>
      VerifyOtpRequest(transactionId: json["transaction_id"], otp: json["otp"]);

  Map<String, dynamic> toJson() => {
    "transaction_id": transactionId,
    "otp": otp,
  };
}
