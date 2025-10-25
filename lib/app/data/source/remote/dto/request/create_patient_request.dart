// To parse this JSON data, do
//
//     final createPatientRequest = createPatientRequestFromJson(jsonString);

import 'dart:convert';

CreatePatientRequest createPatientRequestFromJson(String str) =>
    CreatePatientRequest.fromJson(json.decode(str));

String createPatientRequestToJson(CreatePatientRequest data) =>
    json.encode(data.toJson());

class CreatePatientRequest {
  String? fullname;
  String? nickname;
  String? phone;
  String? email;
  DateTime? birthday;
  bool? gender;
  int? maritalStatusId;
  int? lastEducationId;
  String? job;
  int? religionId;
  String? address;

  CreatePatientRequest({
    this.fullname,
    this.nickname,
    this.phone,
    this.email,
    this.birthday,
    this.gender,
    this.maritalStatusId,
    this.lastEducationId,
    this.job,
    this.religionId,
    this.address,
  });

  factory CreatePatientRequest.fromJson(Map<String, dynamic> json) =>
      CreatePatientRequest(
        fullname: json["fullname"],
        nickname: json["nickname"],
        phone: json["phone"],
        email: json["email"],
        birthday: json["birthday"] == null
            ? null
            : DateTime.parse(json["birthday"]),
        gender: json["gender"],
        maritalStatusId: json["marital_status_id"],
        lastEducationId: json["last_education_id"],
        job: json["job"],
        religionId: json["religion_id"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
    "fullname": fullname,
    "nickname": nickname,
    "phone": phone,
    "email": email,
    "birthday":
        "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "marital_status_id": maritalStatusId,
    "last_education_id": lastEducationId,
    "job": job,
    "religion_id": religionId,
    "address": address,
  };
}
