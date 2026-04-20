// To parse this JSON data, do
//
//     final dailyReportResponseDto = dailyReportResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/data/source/remote/dto/response/daily_report_item_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/pagination_response_dto.dart';

DailyReportResponseDto dailyReportResponseDtoFromJson(String str) =>
    DailyReportResponseDto.fromJson(json.decode(str));

String dailyReportResponseDtoToJson(DailyReportResponseDto data) =>
    json.encode(data.toJson());

class DailyReportResponseDto {
  List<DailyReportItemResponseDto>? dailyReports;
  PaginationResponseDto? pagination;

  DailyReportResponseDto({this.dailyReports, this.pagination});

  factory DailyReportResponseDto.fromJson(Map<String, dynamic> json) =>
      DailyReportResponseDto(
        dailyReports: json["daily_reports"] == null
            ? []
            : List<DailyReportItemResponseDto>.from(
                json["daily_reports"]!.map(
                  (x) => DailyReportItemResponseDto.fromJson(x),
                ),
              ),
        pagination: json["pagination"] == null
            ? null
            : PaginationResponseDto.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
    "daily_reports": dailyReports == null
        ? []
        : List<dynamic>.from(dailyReports!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}
