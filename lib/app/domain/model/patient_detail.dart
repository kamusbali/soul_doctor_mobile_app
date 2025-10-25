import 'package:soul_doctor/app/domain/model/compact_consultation.dart';
import 'package:soul_doctor/app/domain/model/compact_information.dart';
import 'package:soul_doctor/app/domain/model/patient_detail_history.dart';

class PatientDetail {
  CompactInformation patient;
  CompactInformation? caregiver;
  PatientDetailHistory? patientHistory;
  List<CompactConsultation> consultations;

  PatientDetail({
    required this.patient,
    this.caregiver,
    this.patientHistory,
    required this.consultations,
  });
}
