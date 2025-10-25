import 'package:soul_doctor/app/common/constant/default.dart';

class PatientItemSummary {
  int age;
  bool gender;
  bool hasCaregiver;

  PatientItemSummary({
    required this.age,
    required this.gender,
    required this.hasCaregiver,
  });

  factory PatientItemSummary.defaultObj() => PatientItemSummary(
    age: Default.defaultInt,
    gender: Default.defaultBool,
    hasCaregiver: Default.defaultBool,
  );
}
