import 'package:soul_doctor/app/domain/model/compact_profile.dart';
import 'package:soul_doctor/app/domain/model/role.dart';

class CompactUser {
  String fullname;
  Role? role;
  List<CompactProfile>? patients;
  CompactProfile? caregiver;

  CompactUser({
    required this.fullname,
    required this.role,
    this.patients,
    this.caregiver,
  });
}
