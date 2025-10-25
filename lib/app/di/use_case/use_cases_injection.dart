import 'package:soul_doctor/app/di/use_case/auth_use_cases_injection.dart';
import 'package:soul_doctor/app/di/use_case/consultation_use_cases_injection.dart';
import 'package:soul_doctor/app/di/use_case/diagnosis_use_cases_injection.dart';
import 'package:soul_doctor/app/di/use_case/patient_use_cases_injection.dart';
import 'package:soul_doctor/app/di/use_case/profile_use_cases_injection.dart';
import 'package:soul_doctor/app/di/use_case/screening_use_cases_injection.dart';
import 'package:soul_doctor/app/di/use_case/visit_use_cases_injection.dart';
import 'package:soul_doctor/app/di/use_case/volunteer_use_cases_injection.dart';

class UseCasesInjection {
  static void inject() {
    AuthUseCasesInjection.inject();
    ConsultationUseCasesInjection.inject();
    DiagnosisUseCasesInjection.inject();
    PatientUseCasesInjection.inject();
    ProfileUseCasesInjection.inject();
    VisitUseCasesInjection.inject();
    VolunteerUseCasesInjection.inject();
    ScreeningUseCasesInjection.inject();
  }
}
