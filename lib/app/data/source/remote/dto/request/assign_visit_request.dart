// To parse this JSON data, do
//
//     final visitRequest = visitRequestFromJson(jsonString);

import 'dart:convert';

AssignVisitRequest visitRequestFromJson(String str) =>
    AssignVisitRequest.fromJson(json.decode(str));

String visitRequestToJson(AssignVisitRequest data) =>
    json.encode(data.toJson());

class AssignVisitRequest {
  String? consultationId;
  String? volunteerId;
  String? note;

  AssignVisitRequest({this.consultationId, this.volunteerId, this.note});

  factory AssignVisitRequest.fromJson(Map<String, dynamic> json) =>
      AssignVisitRequest(
        consultationId: json["consultation_id"],
        volunteerId: json["volunteer_id"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
    "consultation_id": consultationId,
    "volunteer_id": volunteerId,
    "note": note,
  };
}
