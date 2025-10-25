import 'package:get/get.dart';
import 'package:soul_doctor/app/data/repository/auth_repository_impl.dart';
import 'package:soul_doctor/app/data/repository/consultation_repository_impl.dart';
import 'package:soul_doctor/app/data/repository/diagnosis_repository_impl.dart';
import 'package:soul_doctor/app/data/repository/patient_repository_impl.dart';
import 'package:soul_doctor/app/data/repository/profile_repository_impl.dart';
import 'package:soul_doctor/app/data/repository/screening_repository_impl.dart';
import 'package:soul_doctor/app/data/repository/visit_repository_impl.dart';
import 'package:soul_doctor/app/data/repository/volunteer_repository_impl.dart';
import 'package:soul_doctor/app/domain/repository/auth_repository.dart';
import 'package:soul_doctor/app/domain/repository/consultation_repository.dart';
import 'package:soul_doctor/app/domain/repository/diagnosis_repository.dart';
import 'package:soul_doctor/app/domain/repository/patient_repository.dart';
import 'package:soul_doctor/app/domain/repository/profile_repository.dart';
import 'package:soul_doctor/app/domain/repository/screening_repository.dart';
import 'package:soul_doctor/app/domain/repository/visit_repository.dart';
import 'package:soul_doctor/app/domain/repository/volunteer_repository.dart';

class RepositoryInjection {
  static void inject() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(Get.find()),
      fenix: true,
    );
    Get.lazyPut<ConsultationRepository>(
      () => ConsultationRepositoryImpl(Get.find()),
      fenix: true,
    );
    Get.lazyPut<DiagnosisRepository>(
      () => DiagnosisRepositoryImpl(Get.find()),
      fenix: true,
    );
    Get.lazyPut<PatientRepository>(
      () => PatientRepositoryImpl(Get.find()),
      fenix: true,
    );
    Get.lazyPut<ProfileRepository>(
      () => ProfileRepositoryImpl(Get.find()),
      fenix: true,
    );
    Get.lazyPut<VisitRepository>(
      () => VisitRepositoryImpl(Get.find()),
      fenix: true,
    );
    Get.lazyPut<VolunteerRepository>(
      () => VolunteerRepositoryImpl(Get.find()),
      fenix: true,
    );
    Get.lazyPut<ScreeningRepository>(
      () => ScreeningRepositoryImpl(Get.find()),
      fenix: true,
    );
  }
}
