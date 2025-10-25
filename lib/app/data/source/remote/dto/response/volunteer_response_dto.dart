// To parse this JSON data, do
//
//     final volunteerResponseDto = volunteerResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/data/source/remote/dto/response/pagination_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/volunteer_item_response_dto.dart';

VolunteerResponseDto volunteerResponseDtoFromJson(String str) =>
    VolunteerResponseDto.fromJson(json.decode(str));

String volunteerResponseDtoToJson(VolunteerResponseDto data) =>
    json.encode(data.toJson());

class VolunteerResponseDto {
  List<VolunteerItemResponseDto>? volunteers;
  PaginationResponseDto? pagination;

  VolunteerResponseDto({this.volunteers, this.pagination});

  factory VolunteerResponseDto.fromJson(Map<String, dynamic> json) =>
      VolunteerResponseDto(
        volunteers: json["volunteers"] == null
            ? []
            : List<VolunteerItemResponseDto>.from(
                json["volunteers"]!.map(
                  (x) => VolunteerItemResponseDto.fromJson(x),
                ),
              ),
        pagination: json["pagination"] == null
            ? null
            : PaginationResponseDto.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
    "volunteers": volunteers == null
        ? []
        : List<dynamic>.from(volunteers!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}
