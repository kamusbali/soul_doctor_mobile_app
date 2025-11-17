import 'package:soul_doctor/app/domain/use_case/patient_use_cases/create_patient_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/patient_use_cases/get_patient_detail_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/patient_use_cases/get_patient_use_case.dart';

class PatientUseCases {
  final GetPatientUseCase getPatientUseCase;
  final CreatePatientUseCase createPatientUseCase;
  final GetPatientDetailUseCase getPatientDetailUseCase;

  PatientUseCases({
    required this.getPatientUseCase,
    required this.createPatientUseCase,
    required this.getPatientDetailUseCase,
  });
}
