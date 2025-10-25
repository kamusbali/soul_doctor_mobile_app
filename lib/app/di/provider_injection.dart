import 'package:get/get.dart';
import 'package:soul_doctor/app/data/source/remote/provider/auth_provider.dart';
import 'package:soul_doctor/app/data/source/remote/provider/consultation_provider.dart';
import 'package:soul_doctor/app/data/source/remote/provider/diagnosis_provider.dart';
import 'package:soul_doctor/app/data/source/remote/provider/patient_provider.dart';
import 'package:soul_doctor/app/data/source/remote/provider/profile_provider.dart';
import 'package:soul_doctor/app/data/source/remote/provider/visit_provider.dart';
import 'package:soul_doctor/app/data/source/remote/provider/volunteer_provider.dart';
import 'package:soul_doctor/app/data/source/static/provider.dart/screening_provider.dart';

class ProviderInjection {
  static void inject() {
    Get.put(ProfileProvider());
    Get.put(AuthProvider());
    Get.put(ConsultationProvider());
    Get.put(DiagnosisProvider());
    Get.put(PatientProvider());
    Get.put(VisitProvider());
    Get.put(VolunteerProvider());
    Get.put(ScreeningProvider());
  }
}
