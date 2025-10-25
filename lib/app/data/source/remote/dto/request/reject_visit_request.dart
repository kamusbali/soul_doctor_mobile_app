// To parse this JSON data, do
//
//     final rejectVisitRequest = rejectVisitRequestFromJson(jsonString);

import 'dart:convert';

RejectVisitRequest rejectVisitRequestFromJson(String str) =>
    RejectVisitRequest.fromJson(json.decode(str));

String rejectVisitRequestToJson(RejectVisitRequest data) =>
    json.encode(data.toJson());

class RejectVisitRequest {
  String? visitId;
  String? reason;

  RejectVisitRequest({this.visitId, this.reason});

  factory RejectVisitRequest.fromJson(Map<String, dynamic> json) =>
      RejectVisitRequest(visitId: json["visit_id"], reason: json["reason"]);

  Map<String, dynamic> toJson() => {"visit_id": visitId, "reason": reason};
}
