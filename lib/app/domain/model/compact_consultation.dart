import 'package:soul_doctor/app/domain/model/compact_consultation_detail.dart';

class CompactConsultation {
  String consultationId;
  DateTime date;
  CompactConsultationDetail? compactConsultationDetail;

  CompactConsultation({
    required this.consultationId,
    required this.date,
    this.compactConsultationDetail,
  });
}
