import 'package:soul_doctor/app/domain/model/consultation_status.dart';

enum Role {
  patient,
  caregiver,
  volunteer,
  doctor;

  String get name {
    switch (this) {
      case Role.patient:
        return "Pasien";
      case Role.caregiver:
        return "Health Data Collector";
      case Role.volunteer:
        return "Perawat/Volunteer";
      case Role.doctor:
        return "Dokter";
    }
  }

  int get id {
    switch (this) {
      case Role.patient:
        return 1;
      case Role.caregiver:
        return 2;
      case Role.volunteer:
        return 3;
      case Role.doctor:
        return 4;
    }
  }

  List<ConsultationStatus> get status {
    switch (this) {
      case Role.patient || Role.caregiver:
        return [
          ConsultationStatus.created,
          ConsultationStatus.scheduled,
          ConsultationStatus.completed,
        ];

      case Role.volunteer:
        return [
          ConsultationStatus.waitingVolunteer,
          ConsultationStatus.scheduled,
          ConsultationStatus.completed,
        ];
      case Role.doctor:
        return ConsultationStatus.values;
    }
  }

  static Role? getRoleById(int? id) {
    if (id == Role.patient.id) {
      return Role.patient;
    } else if (id == Role.caregiver.id) {
      return Role.caregiver;
    } else if (id == Role.volunteer.id) {
      return Role.volunteer;
    } else if (id == Role.doctor.id) {
      return Role.doctor;
    }

    return null;
  }

  static Role? getRoleByName(String? name) {
    if (name == "patient") {
      return Role.patient;
    } else if (name == "caregiver") {
      return Role.caregiver;
    } else if (name == "volunteer") {
      return Role.volunteer;
    } else if (name == "doctor") {
      return Role.doctor;
    }
    return null;
  }
}
