// To parse this JSON data, do
//
//     final volunteerItemResponseDto = volunteerItemResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/domain/model/volunteer.dart';

VolunteerItemResponseDto volunteerItemResponseDtoFromJson(String str) =>
    VolunteerItemResponseDto.fromJson(json.decode(str));

String volunteerItemResponseDtoToJson(VolunteerItemResponseDto data) =>
    json.encode(data.toJson());

class VolunteerItemResponseDto {
  String? id;
  String? name;

  VolunteerItemResponseDto({this.id, this.name});

  factory VolunteerItemResponseDto.fromJson(Map<String, dynamic> json) =>
      VolunteerItemResponseDto(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}

extension VolunteerItemResponseDtoConversion on VolunteerItemResponseDto {
  Volunteer toVolunteer() {
    return Volunteer(id: id!, name: name!);
  }
}
