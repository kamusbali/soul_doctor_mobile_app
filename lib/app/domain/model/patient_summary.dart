class PatientSummary {
  bool isContinuation;
  bool isFirstVisit;
  int age;
  bool gender;
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
    gender: false,
    isVisitRejected: false,
    hasCaregiver: false,
  );
}
