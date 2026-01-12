// To parse this JSON data, do
//
//     final profileResponseDto = profileResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/domain/model/gender.dart';
import 'package:soul_doctor/app/domain/model/profile.dart';

ProfileResponseDto profileResponseDtoFromJson(String str) =>
    ProfileResponseDto.fromJson(json.decode(str));

String profileResponseDtoToJson(ProfileResponseDto data) =>
    json.encode(data.toJson());

class ProfileResponseDto {
  String? fullname;
  String? nickname;
  String? nik;
  String? email;
  DateTime? birthday;
  bool? gender;
  int? maritalStatusId;
  int? lastEducationId;
  String? job;
  int? religionId;
  String? phone;
  String? address;

  ProfileResponseDto({
    this.fullname,
    this.nickname,
    this.nik,
    this.email,
    this.birthday,
    this.gender,
    this.maritalStatusId,
    this.lastEducationId,
    this.job,
    this.religionId,
    this.phone,
    this.address,
  });

  factory ProfileResponseDto.fromJson(Map<String, dynamic> json) =>
      ProfileResponseDto(
        fullname: json["fullname"],
        nickname: json["nickname"],
        nik: json["nik"],
        email: json["email"],
        birthday: json["birthday"] == null
            ? null
            : DateTime.parse(json["birthday"]),
        gender: json["gender"],
        maritalStatusId: json["marital_status_id"],
        lastEducationId: json["last_education_id"],
        job: json["job"],
        religionId: json["religion_id"],
        phone: json["phone"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
    "fullname": fullname,
    "nickname": nickname,
    "email": email,
    "nik": nik,
    "birthday":
        "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "marital_status_id": maritalStatusId,
    "last_education_id": lastEducationId,
    "job": job,
    "religion_id": religionId,
    "phone": phone,
    "address": address,
  };
}

extension ProfileResponseDtoConversion on ProfileResponseDto {
  Profile toProfile() {
    return Profile(
      fullname: fullname!,
      nickname: nickname!,
      nik: nik ?? "",
      email: email,
      birthday: birthday!,
      gender: Gender.getGenderByValue(gender ?? false),
      maritalStatusId: maritalStatusId!,
      lastEducationId: lastEducationId!,
      job: job!,
      religionId: religionId!,
      phone: phone,
      address: address!,
    );
  }
}
