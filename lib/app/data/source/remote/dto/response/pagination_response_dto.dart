// To parse this JSON data, do
//
//     final paginationResponseDto = paginationResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/common/constant/default.dart';
import 'package:soul_doctor/app/common/pagination_information.dart';

PaginationResponseDto paginationResponseDtoFromJson(String str) =>
    PaginationResponseDto.fromJson(json.decode(str));

String paginationResponseDtoToJson(PaginationResponseDto data) =>
    json.encode(data.toJson());

class PaginationResponseDto {
  int? currentPage;
  int? totalPage;

  PaginationResponseDto({this.currentPage, this.totalPage});

  factory PaginationResponseDto.fromJson(Map<String, dynamic> json) =>
      PaginationResponseDto(
        currentPage: json["current_page"],
        totalPage: json["total_page"],
      );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "total_page": totalPage,
  };
}

extension PaginationResponseDtoConversion on PaginationResponseDto {
  PaginationInformation toPaginationInformation() {
    return PaginationInformation(
      currentPage: currentPage ?? Default.defaultInt,
      totalPage: totalPage ?? Default.defaultInt,
    );
  }
}
