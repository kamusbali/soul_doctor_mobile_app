import 'package:soul_doctor/app/common/constant/default.dart';
import 'package:soul_doctor/app/domain/model/gender.dart';

class Profile {
  String fullname;
  String nickname;
  String? email;
  DateTime birthday;
  Gender gender;
  int maritalStatusId;
  int lastEducationId;
  String job;
  int religionId;
  String? phone;
  String address;

  Profile({
    required this.fullname,
    required this.nickname,
    this.email,
    required this.birthday,
    required this.gender,
    required this.maritalStatusId,
    required this.lastEducationId,
    required this.job,
    required this.religionId,
    this.phone,
    required this.address,
  });

  factory Profile.defaultObj() => Profile(
    fullname: Default.defaultString,
    nickname: Default.defaultString,
    email: Default.defaultString,
    birthday: Default.defaultDateTime,
    gender: Gender.male,
    maritalStatusId: Default.defaultInt,
    lastEducationId: Default.defaultInt,
    job: Default.defaultString,
    religionId: Default.defaultInt,
    phone: Default.defaultString,
    address: Default.defaultString,
  );
}
