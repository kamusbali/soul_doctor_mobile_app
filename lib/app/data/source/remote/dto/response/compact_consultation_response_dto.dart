// To parse this JSON data, do
//
//     final patientDetailCompactConsultationResponseDto = patientDetailCompactConsultationResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/data/source/remote/dto/response/compact_consultation_detail_response_dto.dart';

CompactConsultationResponseDto
patientDetailCompactConsultationResponseDtoFromJson(String str) =>
    CompactConsultationResponseDto.fromJson(json.decode(str));

String patientDetailCompactConsultationResponseDtoToJson(
  CompactConsultationResponseDto data,
) => json.encode(data.toJson());

class CompactConsultationResponseDto {
  String? consultationId;
  DateTime? date;
  CompactConsultationDetailResponseDto? compactConsultationDetailResponseDto;

  CompactConsultationResponseDto({
    this.consultationId,
    this.date,
    this.compactConsultationDetailResponseDto,
  });

  factory CompactConsultationResponseDto.fromJson(Map<String, dynamic> json) =>
      CompactConsultationResponseDto(
        consultationId: json["consultation_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        compactConsultationDetailResponseDto: json["detail"] == null
            ? null
            : CompactConsultationDetailResponseDto.fromJson(json["detail"]),
      );

  Map<String, dynamic> toJson() => {
    "consultation_id": consultationId,
    "date":
        "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "detail": compactConsultationDetailResponseDto?.toJson(),
  };
}
