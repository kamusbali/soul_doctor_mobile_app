enum Role {
  patient,
  caregiver,
  volunteer,
  doctor,
  guest;

  String get name {
    switch (this) {
      case Role.patient:
        return "Pasien";
      case Role.caregiver:
        return "Pengasuh";
      case Role.volunteer:
        return "Volunteer";
      case Role.doctor:
        return "Dokter";
      case Role.guest:
        return "Guest";
    }
  }
}
