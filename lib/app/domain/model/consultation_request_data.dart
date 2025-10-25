class ConsultationRequestData {
  String symptom;
  DateTime startDate;
  String? image;

  ConsultationRequestData({
    required this.symptom,
    required this.startDate,
    this.image,
  });
}
