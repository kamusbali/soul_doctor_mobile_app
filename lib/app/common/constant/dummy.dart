import 'dart:math';

import 'package:soul_doctor/app/common/constant/const_path.dart';
import 'package:soul_doctor/app/domain/model/role.dart';

abstract class Dummy {
  static String photoProfile({required Role role}) =>
      "${ConstPath.AVATAR_DEFAULT_PATH}/${role == Role.patient
          ? 'patient'
          : role == Role.caregiver
          ? 'caregiver'
          : role == Role.doctor
          ? 'doctor'
          : 'volunteer'}.png";
}
