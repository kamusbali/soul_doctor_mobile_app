import 'package:hive/hive.dart';

import '../dto/patient_local_dto.dart';

class PatientLocalProvider {
  final Box _patientBox = Hive.box('patient');

  Future<void> addPatientData({required List<PatientLocalDto> patients}) async {
    final data = <dynamic, Map<String, dynamic>>{
      for (final patient in patients) patient.id: patient.toJson(),
    };

    // Write the fresh response before removing stale records so an interrupted
    // refresh never leaves an otherwise valid cache completely empty.
    await _patientBox.putAll(data);
    final staleKeys = _patientBox.keys
        .where((key) => !data.containsKey(key))
        .toList(growable: false);
    await _patientBox.deleteAll(staleKeys);
  }

  List<PatientLocalDto> getAllPatientData({String? query}) {
    final patients = _patientBox.values
        .map((e) => PatientLocalDto.fromJson(Map<String, dynamic>.from(e)))
        .toList();

    final normalizedQuery = query?.trim().toLowerCase() ?? '';
    if (normalizedQuery.isEmpty) return patients;

    return patients
        .where(
          (patient) =>
              patient.name?.toLowerCase().contains(normalizedQuery) ?? false,
        )
        .toList();
  }
}
