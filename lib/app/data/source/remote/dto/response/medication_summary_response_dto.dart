// To parse this JSON data, do
//
//     final medicationSummaryResponseDto = medicationSummaryResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/domain/model/medication_summary.dart';

import '../../../../../common/constant/default.dart';

MedicationSummaryResponseDto medicationSummaryResponseDtoFromJson(String str) =>
    MedicationSummaryResponseDto.fromJson(json.decode(str));

String medicationSummaryResponseDtoToJson(MedicationSummaryResponseDto data) =>
    json.encode(data.toJson());

class MedicationSummaryResponseDto {
  bool? medication;
  bool? therapy;
  bool? visit;

  MedicationSummaryResponseDto({this.medication, this.therapy, this.visit});

  factory MedicationSummaryResponseDto.fromJson(Map<String, dynamic> json) =>
      MedicationSummaryResponseDto(
        medication: json["medication"],
        therapy: json["therapy"],
        visit: json["visit"],
      );

  Map<String, dynamic> toJson() => {
    "medication": medication,
    "therapy": therapy,
    "visit": visit,
  };
}

extension MedicationSummaryResponseDtoConversion
    on MedicationSummaryResponseDto {
  MedicationSummary toMedicationSummary() {
    return MedicationSummary(
      medication: medication ?? Default.defaultBool,
      therapy: medication ?? Default.defaultBool,
      visit: medication ?? Default.defaultBool,
    );
  }
}
