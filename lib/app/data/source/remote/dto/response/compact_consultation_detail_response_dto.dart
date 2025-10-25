// To parse this JSON data, do
//
//     final compactConsultationDetailResponseDto = compactConsultationDetailResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/domain/model/compact_consultation_detail.dart';

CompactConsultationDetailResponseDto
compactConsultationDetailResponseDtoFromJson(String str) =>
    CompactConsultationDetailResponseDto.fromJson(json.decode(str));

String compactConsultationDetailResponseDtoToJson(
  CompactConsultationDetailResponseDto data,
) => json.encode(data.toJson());

class CompactConsultationDetailResponseDto {
  String? symptom;
  DateTime? startDate;
  String? symptomImage;
  String? observation;
  String? diagnosis;
  String? medication;
  String? therapy;
  String? visitor;
  List<String>? visitImages;

  CompactConsultationDetailResponseDto({
    this.symptom,
    this.startDate,
    this.symptomImage,
    this.observation,
    this.diagnosis,
    this.medication,
    this.therapy,
    this.visitor,
    this.visitImages,
  });

  factory CompactConsultationDetailResponseDto.fromJson(
    Map<String, dynamic> json,
  ) => CompactConsultationDetailResponseDto(
    symptom: json["symptom"],
    startDate: json["start_date"] == null
        ? null
        : DateTime.parse(json["start_date"]),
    symptomImage: json["symptom_image"],
    observation: json["observation"],
    diagnosis: json["diagnosis"],
    medication: json["medication"],
    therapy: json["therapy"],
    visitor: json["visitor"],
    visitImages: json["visit_images"] == null
        ? []
        : List<String>.from(json["visit_images"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "symptom": symptom,
    "start_date":
        "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "symptom_image": symptomImage,
    "observation": observation,
    "diagnosis": diagnosis,
    "medication": medication,
    "therapy": therapy,
    "visitor": visitor,
    "visit_images": visitImages == null
        ? []
        : List<dynamic>.from(visitImages!.map((x) => x)),
  };
}

extension CompactConsultationDetailDtoConversion
    on CompactConsultationDetailResponseDto {
  CompactConsultationDetail toCompactConsultationDetail() {
    return CompactConsultationDetail(
      symptom: symptom!,
      startDate: startDate!,
      symptomImage: symptomImage,
      observation: observation,
      diagnosis: diagnosis,
      medication: medication,
      therapy: therapy,
      visitor: visitor,
      visitImages: visitImages ?? [],
    );
  }
}
