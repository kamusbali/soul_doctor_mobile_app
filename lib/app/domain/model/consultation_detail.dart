import 'package:soul_doctor/app/domain/model/consultation_request_data.dart';
import 'package:soul_doctor/app/domain/model/consultation_status.dart';
import 'package:soul_doctor/app/domain/model/consultation_type.dart';
import 'package:soul_doctor/app/domain/model/current_visit.dart';
import 'package:soul_doctor/app/domain/model/doctor_diagnosis.dart';
import 'package:soul_doctor/app/domain/model/profile.dart';
import 'package:soul_doctor/app/domain/model/recent_visitor.dart';
import 'package:soul_doctor/app/domain/model/visit_result.dart';
import 'package:soul_doctor/app/domain/model/visitor_rejection.dart';

class ConsultationDetail {
  ConsultationStatus state;
  ConsultationType type;
  Profile patient;
  Profile? caregiver;
  CurrentVisit? currentVisit;
  ConsultationRequestData consultationRequest;
  List<RecentVisitor> recentVisitors;
  List<VisitorRejection> visitorRejections;
  VisitResult? visitResult;
  DoctorDiagnosis? doctorDiagnosis;

  ConsultationDetail({
    required this.state,
    required this.type,
    required this.patient,
    this.caregiver,
    this.currentVisit,
    required this.consultationRequest,
    required this.recentVisitors,
    required this.visitorRejections,
    this.visitResult,
    this.doctorDiagnosis,
  });
}
