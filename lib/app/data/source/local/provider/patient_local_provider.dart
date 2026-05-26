import 'package:hive/hive.dart';

import '../dto/patient_local_dto.dart';

class PatientLocalProvider {
  final Box _patientBox = Hive.box('patient');

  Future<void> addPatientData({required List<PatientLocalDto> patients}) async {
    await _patientBox.clear();
    for (var patient in patients) {
      await _patientBox.put(patient.id, patient.toJson());
    }
  }

  List<PatientLocalDto> getAllPatientData() {
    return _patientBox.values
        .map((e) => PatientLocalDto.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
}
