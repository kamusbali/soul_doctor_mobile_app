// To parse this JSON data, do
//
//     final visitorResultResponseDto = visitorResultResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/domain/model/visit_result.dart';

VisitResultResponseDto visitorResultResponseDtoFromJson(String str) =>
    VisitResultResponseDto.fromJson(json.decode(str));

String visitorResultResponseDtoToJson(VisitResultResponseDto data) =>
    json.encode(data.toJson());

class VisitResultResponseDto {
  String? observation;
  List<String>? images;

  VisitResultResponseDto({this.observation, this.images});

  factory VisitResultResponseDto.fromJson(Map<String, dynamic> json) =>
      VisitResultResponseDto(
        observation: json["observation"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
    "observation": observation,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
  };
}

extension VisitResultReponseDtoConversion on VisitResultResponseDto {
  VisitResult toVisitResult() {
    return VisitResult(observation: observation!, images: images ?? []);
  }
}
