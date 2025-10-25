import 'package:soul_doctor/app/domain/model/patient_item_summary.dart';

class Patient {
  String id;
  String name;
  PatientItemSummary summary;

  Patient({required this.id, required this.name, required this.summary});
}
