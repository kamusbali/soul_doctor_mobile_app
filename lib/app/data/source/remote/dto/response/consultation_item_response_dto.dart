// To parse this JSON data, do
//
//     final consultationItemResponseDto = consultationItemResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/common/constant/default.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/medication_summary_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/patient_summary_response_dto.dart';
import 'package:soul_doctor/app/domain/model/consultation.dart';
import 'package:soul_doctor/app/domain/model/consultation_status.dart';
import 'package:soul_doctor/app/domain/model/consultation_type.dart';
import 'package:soul_doctor/app/domain/model/medication_summary.dart';
import 'package:soul_doctor/app/domain/model/patient_summary.dart';

ConsultationItemResponseDto consultationItemResponseDtoFromJson(String str) =>
    ConsultationItemResponseDto.fromJson(json.decode(str));

String consultationItemResponseDtoToJson(ConsultationItemResponseDto data) =>
    json.encode(data.toJson());

class ConsultationItemResponseDto {
  String? id;
  String? name;
  String? description;
  String? address;
  int? state;
  int? type;
  DateTime? visitDate;
  MedicationSummaryResponseDto? medicationSummary;
  PatientSummaryResponseDto? patientSummary;

  ConsultationItemResponseDto({
    this.id,
    this.name,
    this.description,
    this.address,
    this.state,
    this.type,
    this.visitDate,
    this.medicationSummary,
    this.patientSummary,
  });

  factory ConsultationItemResponseDto.fromJson(Map<String, dynamic> json) =>
      ConsultationItemResponseDto(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        address: json["address"],
        state: json["state"],
        type: json["type"],
        visitDate: json["visit_date"] == null
            ? null
            : DateTime.parse(json["visit_date"]),
        medicationSummary: json["medication_summary"] == null
            ? null
            : MedicationSummaryResponseDto.fromJson(
                Map<String, dynamic>.from(json["medication_summary"]),
              ),
        patientSummary: json["patient_summary"] == null
            ? null
            : PatientSummaryResponseDto.fromJson(
                Map<String, dynamic>.from(json["patient_summary"]),
              ),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "address": address,
    "state": state,
    "type": type,
    "visit_date": visitDate?.toIso8601String(),
    "medication_summary": medicationSummary?.toJson(),
    "patient_summary": patientSummary?.toJson(),
  };
}

extension ConsultationItemResponseDtoConversion on ConsultationItemResponseDto {
  Consultation toConsultation() {
    return Consultation(
      id: id ?? Default.defaultString,
      name: name ?? Default.defaultString,
      description: description ?? Default.defaultString,
      address: address ?? Default.defaultString,
      state: ConsultationStatus.getConsultationStatusById(state!)!,

      type: ConsultationType.getConsultationTypeById(type!)!,
      visitDate: visitDate ?? DateTime.now(),
      medicationSummary:
          medicationSummary?.toMedicationSummary() ??
          MedicationSummary.defaultObj(),
      patientSummary:
          patientSummary?.toPatientSummary() ?? PatientSummary.defaultObj(),
    );
  }
}
