// To parse this JSON data, do
//
//     final consultationDetailResponseDto = consultationDetailResponseDtoFromJson(jsonString);

import 'package:soul_doctor/app/domain/model/current_visit.dart';

class CurrentVisitResponseDto {
  String? visitId;
  String? visitor;
  String? visitNote;

  CurrentVisitResponseDto({this.visitId, this.visitor, this.visitNote});

  factory CurrentVisitResponseDto.fromJson(Map<String, dynamic> json) =>
      CurrentVisitResponseDto(
        visitId: json["visit_id"],
        visitor: json["visitor"],
        visitNote: json["visit_note"],
      );

  Map<String, dynamic> toJson() => {
    "visit_id": visitId,
    "visitor": visitor,
    "visit_note": visitNote,
  };
}

extension CurrentVisitResponseDtoConversion on CurrentVisitResponseDto {
  CurrentVisit toCurrentVisit() {
    return CurrentVisit(
      visitId: visitId!,
      visitor: visitor,
      visitNote: visitNote,
    );
  }
}
