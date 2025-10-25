// To parse this JSON data, do
//
//     final acceptVisitRequestDto = acceptVisitRequestDtoFromJson(jsonString);

import 'dart:convert';

AcceptVisitRequestDto acceptVisitRequestDtoFromJson(String str) => AcceptVisitRequestDto.fromJson(json.decode(str));

String acceptVisitRequestDtoToJson(AcceptVisitRequestDto data) => json.encode(data.toJson());

class AcceptVisitRequestDto {
    String? visitId;

    AcceptVisitRequestDto({
        this.visitId,
    });

    factory AcceptVisitRequestDto.fromJson(Map<String, dynamic> json) => AcceptVisitRequestDto(
        visitId: json["visit_id"],
    );

    Map<String, dynamic> toJson() => {
        "visit_id": visitId,
    };
}
