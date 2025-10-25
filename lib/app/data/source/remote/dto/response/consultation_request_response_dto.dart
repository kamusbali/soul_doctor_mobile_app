// To parse this JSON data, do
//
//     final consultationRequestResponseDto = consultationRequestResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/domain/model/consultation_request_data.dart';

ConsultationRequestResponseDto consultationRequestResponseDtoFromJson(
  String str,
) => ConsultationRequestResponseDto.fromJson(json.decode(str));

String consultationRequestResponseDtoToJson(
  ConsultationRequestResponseDto data,
) => json.encode(data.toJson());

class ConsultationRequestResponseDto {
  String? symptom;
  DateTime? startDate;
  String? image;

  ConsultationRequestResponseDto({this.symptom, this.startDate, this.image});

  factory ConsultationRequestResponseDto.fromJson(Map<String, dynamic> json) =>
      ConsultationRequestResponseDto(
        symptom: json["symptom"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
    "symptom": symptom,
    "start_date":
        "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "image": image,
  };
}

extension ConsultationRequestResonseDtoConversion
    on ConsultationRequestResponseDto {
  ConsultationRequestData toConsultationRequestData() {
    return ConsultationRequestData(
      symptom: symptom!,
      startDate: startDate!,
      image: image,
    );
  }
}
