// To parse this JSON data, do
//
//     final changePinRequest = changePinRequestFromJson(jsonString);

import 'dart:convert';

ChangePinRequest changePinRequestFromJson(String str) =>
    ChangePinRequest.fromJson(json.decode(str));

String changePinRequestToJson(ChangePinRequest data) =>
    json.encode(data.toJson());

class ChangePinRequest {
  String? newPin;
  String? newPinRepeat;

  ChangePinRequest({this.newPin, this.newPinRepeat});

  factory ChangePinRequest.fromJson(Map<String, dynamic> json) =>
      ChangePinRequest(
        newPin: json["new_pin"],
        newPinRepeat: json["new_pin_repeat"],
      );

  Map<String, dynamic> toJson() => {
    "new_pin": newPin,
    "new_pin_repeat": newPinRepeat,
  };
}
