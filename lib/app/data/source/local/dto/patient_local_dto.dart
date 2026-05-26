import 'package:soul_doctor/app/data/source/remote/dto/response/patient_item_response_dto.dart';

import 'patient_summary_local_dto.dart';

class PatientLocalDto {
  String? id;
  String? name;
  PatientSummaryLocalDto? summary;

  PatientLocalDto({this.id, this.name, this.summary});

  factory PatientLocalDto.fromJson(Map<String, dynamic> json) =>
      PatientLocalDto(
        id: json["id"],
        name: json["name"],
        summary: json["summary"] == null
            ? null
            : PatientSummaryLocalDto.fromJson(json["summary"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "summary": summary?.toJson(),
  };
}

extension PatientLocalDtoConversion on PatientLocalDto {
  PatientItemResponseDto toPatientItemResponseDto() {
    return PatientItemResponseDto(
      id: id!,
      name: name!,
      summary: summary?.toPatientItemSummaryResponseDto(),
    );
  }
}
