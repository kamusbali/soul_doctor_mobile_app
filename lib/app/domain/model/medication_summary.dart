class MedicationSummary {
  bool medication;
  bool therapy;
  bool visit;

  MedicationSummary({
    required this.medication,
    required this.therapy,
    required this.visit,
  });

  factory MedicationSummary.defaultObj() =>
      MedicationSummary(medication: false, therapy: false, visit: false);
}
