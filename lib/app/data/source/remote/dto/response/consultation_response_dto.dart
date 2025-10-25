// To parse this JSON data, do
//
//     final consultationResponseDto = consultationResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/common/pagination_information.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/consultation_item_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/pagination_response_dto.dart';
import 'package:soul_doctor/app/common/pagination.dart';
import 'package:soul_doctor/app/domain/model/consultation.dart';

ConsultationResponseDto consultationResponseDtoFromJson(String str) =>
    ConsultationResponseDto.fromJson(json.decode(str));

String consultationResponseDtoToJson(ConsultationResponseDto data) =>
    json.encode(data.toJson());

class ConsultationResponseDto {
  List<ConsultationItemResponseDto>? consultations;
  PaginationResponseDto? pagination;

  ConsultationResponseDto({this.consultations, this.pagination});

  factory ConsultationResponseDto.fromJson(Map<String, dynamic> json) =>
      ConsultationResponseDto(
        consultations: json["consultations"] == null
            ? []
            : List<ConsultationItemResponseDto>.from(
                json["consultations"]!.map(
                  (x) => ConsultationItemResponseDto.fromJson(x),
                ),
              ),
        pagination: json["pagination"] == null
            ? null
            : PaginationResponseDto.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
    "consultations": consultations == null
        ? []
        : List<dynamic>.from(consultations!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}

extension ConsultationResponseDtoConversion on ConsultationResponseDto {
  Pagination<List<Consultation>> toConsultationPaging() {
    return Pagination(
      data: consultations?.map((e) => e.toConsultation()).toList() ?? [],
      paginationData:
          pagination?.toPaginationInformation() ??
          PaginationInformation.defaultObj(),
    );
  }
}
