import 'package:soul_doctor/app/domain/model/consultation_status.dart';
import 'package:soul_doctor/app/domain/model/consultation_type.dart';
import 'package:soul_doctor/app/domain/model/medication_summary.dart';
import 'package:soul_doctor/app/domain/model/patient_summary.dart';

class Consultation {
  String id;
  String name;
  String description;
  String address;
  ConsultationStatus state;
  ConsultationType type;
  DateTime? visitDate;
  MedicationSummary medicationSummary;
  PatientSummary patientSummary;

  Consultation({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.state,
    required this.type,
    required this.visitDate,
    required this.medicationSummary,
    required this.patientSummary,
  });
}
