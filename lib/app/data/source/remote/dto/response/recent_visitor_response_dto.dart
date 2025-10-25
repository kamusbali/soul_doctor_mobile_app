// To parse this JSON data, do
//
//     final recentVisitorResponseDto = recentVisitorResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/domain/model/recent_visitor.dart';

List<RecentVisitorResponseDto> recentVisitorResponseDtoFromJson(String str) =>
    List<RecentVisitorResponseDto>.from(
      json.decode(str).map((x) => RecentVisitorResponseDto.fromJson(x)),
    );

String recentVisitorResponseDtoToJson(List<RecentVisitorResponseDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecentVisitorResponseDto {
  DateTime? date;
  String? name;

  RecentVisitorResponseDto({this.date, this.name});

  factory RecentVisitorResponseDto.fromJson(Map<String, dynamic> json) =>
      RecentVisitorResponseDto(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
    "date":
        "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "name": name,
  };
}

extension RecentVisitorResponseDtoConversion on RecentVisitorResponseDto {
  RecentVisitor toRecentVisitor() {
    return RecentVisitor(date: date!, name: name!);
  }
}
