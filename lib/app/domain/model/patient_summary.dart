import 'package:soul_doctor/app/domain/model/gender.dart';

class PatientSummary {
  bool isContinuation;
  bool isFirstVisit;
  int age;
  Gender gender;
  bool isVisitRejected;
  bool hasCaregiver;

  PatientSummary({
    required this.isContinuation,
    required this.isFirstVisit,
    required this.age,
    required this.gender,
    required this.isVisitRejected,
    required this.hasCaregiver,
  });

  factory PatientSummary.defaultObj() => PatientSummary(
    isContinuation: false,
    isFirstVisit: false,
    age: -99,
    gender: Gender.male,
    isVisitRejected: false,
    hasCaregiver: false,
  );
}
