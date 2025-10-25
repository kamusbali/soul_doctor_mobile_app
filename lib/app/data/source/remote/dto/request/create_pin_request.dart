// To parse this JSON data, do
//
//     final createPinRequest = createPinRequestFromJson(jsonString);

import 'dart:convert';

CreatePinRequest createPinRequestFromJson(String str) =>
    CreatePinRequest.fromJson(json.decode(str));

String createPinRequestToJson(CreatePinRequest data) =>
    json.encode(data.toJson());

class CreatePinRequest {
  String? transactionId;
  String? pin;
  String? pinRepeat;

  CreatePinRequest({this.transactionId, this.pin, this.pinRepeat});

  factory CreatePinRequest.fromJson(Map<String, dynamic> json) =>
      CreatePinRequest(
        transactionId: json["transaction_id"],
        pin: json["pin"],
        pinRepeat: json["pin_repeat"],
      );

  Map<String, dynamic> toJson() => {
    "transaction_id": transactionId,
    "pin": pin,
    "pin_repeat": pinRepeat,
  };
}
