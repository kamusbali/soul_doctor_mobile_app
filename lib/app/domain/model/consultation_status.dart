import 'package:flutter/material.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';
import 'package:soul_doctor/app/domain/model/role.dart';

enum ConsultationStatus {
  created,
  waitingVolunteer,
  scheduled,
  needDiagnosis,
  completed;

  int get id {
    switch (this) {
      case ConsultationStatus.created:
        return 1;
      case ConsultationStatus.waitingVolunteer:
        return 2;
      case ConsultationStatus.scheduled:
        return 3;
      case ConsultationStatus.needDiagnosis:
        return 4;
      case ConsultationStatus.completed:
        return 5;
    }
  }

  String getName(Role? role) {
    switch (this) {
      case ConsultationStatus.created:
        return role == Role.patient ? "Menunggu Dokter" : "Diajukan";
      case ConsultationStatus.waitingVolunteer:
        return role == Role.doctor ? "Menunggu Volunteer" : "Permintaan Visit";
      case ConsultationStatus.scheduled:
        return role == Role.doctor ? "Terjadwal" : "Menunggu Visit";
      case ConsultationStatus.needDiagnosis:
        return "Perlu Tinjauan Dokter";
      case ConsultationStatus.completed:
        return "Selesai";
    }
  }

  Color getColor(Role? role) {
    switch (this) {
      case ConsultationStatus.created:
        return role == Role.doctor
            ? ColorTheme.COBALT_200
            : ColorTheme.GAMBOGE_200;
      case ConsultationStatus.waitingVolunteer:
        return ColorTheme.GAMBOGE_200;
      case ConsultationStatus.scheduled:
        return role == Role.doctor
            ? ColorTheme.PERSIAN_BLUE_200
            : ColorTheme.COBALT_200;
      case ConsultationStatus.needDiagnosis:
        return ColorTheme.DEEP_LEMON_200;
      case ConsultationStatus.completed:
        return ColorTheme.EUCALYPTUS_200;
    }
  }

  static ConsultationStatus? getConsultationStatusById(int state) {
    if (state == ConsultationStatus.created.id) {
      return ConsultationStatus.created;
    } else if (state == ConsultationStatus.waitingVolunteer.id) {
      return ConsultationStatus.waitingVolunteer;
    } else if (state == ConsultationStatus.scheduled.id) {
      return ConsultationStatus.scheduled;
    } else if (state == ConsultationStatus.needDiagnosis.id) {
      return ConsultationStatus.needDiagnosis;
    } else if (state == ConsultationStatus.completed.id) {
      return ConsultationStatus.completed;
    } else {
      return null;
    }
  }
}
