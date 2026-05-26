// To parse this JSON data, do
//
//     final patientItemSummaryResponseDto = patientItemSummaryResponseDtoFromJson(jsonString);

import '../../remote/dto/response/patient_item_summary_response_dto.dart';

class PatientSummaryLocalDto {
  int? age;
  bool? gender;
  bool? hasCaregiver;

  PatientSummaryLocalDto({this.age, this.gender, this.hasCaregiver});

  factory PatientSummaryLocalDto.fromJson(Map<String, dynamic> json) =>
      PatientSummaryLocalDto(
        age: json["age"],
        gender: json["gender"],
        hasCaregiver: json["has_caregiver"],
      );

  Map<String, dynamic> toJson() => {
    "age": age,
    "gender": gender,
    "has_caregiver": hasCaregiver,
  };
}

extension PatientSummaryLocalDtoConversion on PatientSummaryLocalDto {
  PatientItemSummaryResponseDto toPatientItemSummaryResponseDto() {
    return PatientItemSummaryResponseDto(
      age: age!,
      gender: gender!,
      hasCaregiver: hasCaregiver!,
    );
  }
}
