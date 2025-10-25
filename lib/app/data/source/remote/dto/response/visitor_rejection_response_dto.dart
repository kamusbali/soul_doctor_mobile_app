// To parse this JSON data, do
//
//     final visitorRejectionResponseDto = visitorRejectionResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/domain/model/visitor_rejection.dart';

List<VisitorRejectionResponseDto> visitorRejectionResponseDtoFromJson(
  String str,
) => List<VisitorRejectionResponseDto>.from(
  json.decode(str).map((x) => VisitorRejectionResponseDto.fromJson(x)),
);

String visitorRejectionResponseDtoToJson(
  List<VisitorRejectionResponseDto> data,
) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VisitorRejectionResponseDto {
  DateTime? time;
  String? name;
  String? reason;

  VisitorRejectionResponseDto({this.time, this.name, this.reason});

  factory VisitorRejectionResponseDto.fromJson(Map<String, dynamic> json) =>
      VisitorRejectionResponseDto(
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        name: json["name"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
    "time":
        "${time!.year.toString().padLeft(4, '0')}-${time!.month.toString().padLeft(2, '0')}-${time!.day.toString().padLeft(2, '0')}",
    "name": name,
    "reason": reason,
  };
}

extension VisitorRejectionResponseDtoConversion on VisitorRejectionResponseDto {
  VisitorRejection toVisitorRejection() {
    return VisitorRejection(time: time!, name: name!, reason: reason!);
  }
}
