// To parse this JSON data, do
//
//     final visitorResultResponseDto = visitorResultResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/common/constant/default.dart';
import 'package:soul_doctor/app/domain/model/visit_result.dart';
import 'package:soul_doctor/app/domain/model/visit_result_status.dart';

VisitResultResponseDto visitorResultResponseDtoFromJson(String str) =>
    VisitResultResponseDto.fromJson(json.decode(str));

String visitorResultResponseDtoToJson(VisitResultResponseDto data) =>
    json.encode(data.toJson());

class VisitResultResponseDto {
  String? observation;
  bool? sideEffect;
  int? resultStatusId;
  List<String>? images;

  VisitResultResponseDto({
    this.observation,
    this.sideEffect,
    this.resultStatusId,
    this.images,
  });

  factory VisitResultResponseDto.fromJson(Map<String, dynamic> json) =>
      VisitResultResponseDto(
        observation: json["observation"],
        sideEffect: json["side_effect"],
        resultStatusId: json["result_status_id"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
    "observation": observation,
    "side_effect": sideEffect,
    "result_status_id": resultStatusId,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
  };
}

extension VisitResultReponseDtoConversion on VisitResultResponseDto {
  VisitResult toVisitResult() {
    return VisitResult(
      observation: observation!,
      sideEffect: sideEffect,
      resultStatus: VisitResultStatus.getVisitResultById(
        resultStatusId ?? Default.defaultInt,
      ),
      images: images ?? [],
    );
  }
}
