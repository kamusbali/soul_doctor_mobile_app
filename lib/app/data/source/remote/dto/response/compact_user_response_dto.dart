// To parse this JSON data, do
//
//     final compactUserResponseDto = compactUserResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/common/constant/default.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/compact_profile_response_dto.dart';
import 'package:soul_doctor/app/domain/model/compact_user.dart';
import 'package:soul_doctor/app/domain/model/role.dart';

CompactUserResponseDto compactUserResponseDtoFromJson(String str) =>
    CompactUserResponseDto.fromJson(json.decode(str));

String compactUserResponseDtoToJson(CompactUserResponseDto data) =>
    json.encode(data.toJson());

class CompactUserResponseDto {
  String? fullname;
  int? role;
  List<CompactProfileResponseDto>? patients;
  CompactProfileResponseDto? caregiver;

  CompactUserResponseDto({
    this.fullname,
    this.role,
    this.patients,
    this.caregiver,
  });

  factory CompactUserResponseDto.fromJson(Map<String, dynamic> json) =>
      CompactUserResponseDto(
        fullname: json["fullname"],
        role: json["role"],
        patients: json["patients"] == null
            ? []
            : List<CompactProfileResponseDto>.from(
                json["patients"]!.map(
                  (x) => CompactProfileResponseDto.fromJson(x),
                ),
              ),
        caregiver: json["caregiver"] == null
            ? null
            : CompactProfileResponseDto.fromJson(json["caregiver"]),
      );

  Map<String, dynamic> toJson() => {
    "fullname": fullname,
    "role": role,
    "patients": patients == null
        ? []
        : List<dynamic>.from(patients!.map((x) => x.toJson())),
    "caregiver": caregiver?.toJson(),
  };
}

extension CompactUserResponseDtoConversion on CompactUserResponseDto {
  CompactUser toCompactUser() {
    return CompactUser(
      fullname: fullname ?? Default.defaultString,
      role: Role.getRoleById(role ?? Default.defaultInt),
      patients: patients?.map((e) => e.toCompactProfile()).toList(),
      caregiver: caregiver?.toCompactProfile(),
    );
  }
}
