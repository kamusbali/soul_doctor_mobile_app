class CompactConsultationDetail {
  String symptom;
  DateTime startDate;
  String? symptomImage;
  String? observation;
  String? diagnosis;
  String? medication;
  String? therapy;
  String? visitor;
  List<String> visitImages;

  CompactConsultationDetail({
    required this.symptom,
    required this.startDate,
    this.symptomImage,
    this.observation,
    this.diagnosis,
    this.medication,
    this.therapy,
    this.visitor,
    required this.visitImages,
  });
}
