// To parse this JSON data, do
//
//     final changePinRequest = changePinRequestFromJson(jsonString);

import 'dart:convert';

ChangePinRequest changePinRequestFromJson(String str) =>
    ChangePinRequest.fromJson(json.decode(str));

String changePinRequestToJson(ChangePinRequest data) =>
    json.encode(data.toJson());

class ChangePinRequest {
  String? oldPin;
  String? newPin;
  String? newPinRepeat;

  ChangePinRequest({this.oldPin, this.newPin, this.newPinRepeat});

  factory ChangePinRequest.fromJson(Map<String, dynamic> json) =>
      ChangePinRequest(
        oldPin: json["old_pin"],
        newPin: json["new_pin"],
        newPinRepeat: json["new_pin_repeat"],
      );

  Map<String, dynamic> toJson() => {
    "old_pin": oldPin,
    "new_pin": newPin,
    "new_pin_repeat": newPinRepeat,
  };
}
