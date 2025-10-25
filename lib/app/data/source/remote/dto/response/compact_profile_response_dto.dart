// To parse this JSON data, do
//
//     final caregiverResponseDto = caregiverResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/common/constant/default.dart';
import 'package:soul_doctor/app/domain/model/compact_profile.dart';

CompactProfileResponseDto caregiverResponseDtoFromJson(String str) =>
    CompactProfileResponseDto.fromJson(json.decode(str));

String caregiverResponseDtoToJson(CompactProfileResponseDto data) =>
    json.encode(data.toJson());

class CompactProfileResponseDto {
  String? id;
  String? name;

  CompactProfileResponseDto({this.id, this.name});

  factory CompactProfileResponseDto.fromJson(Map<String, dynamic> json) =>
      CompactProfileResponseDto(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}

extension CompactProfileResponseDtoConversion on CompactProfileResponseDto {
  CompactProfile toCompactProfile() {
    return CompactProfile(
      id: id ?? Default.defaultString,
      name: name ?? Default.defaultString,
    );
  }
}
