// To parse this JSON data, do
//
//     final reminderCareTaskResponseDto = reminderCareTaskResponseDtoFromJson(jsonString);

import 'package:soul_doctor/app/data/source/remote/dto/response/detail_reminder_care_task_response_dto.dart';

import '../../../../../domain/model/reminder_care_task.dart';

class ReminderCareTaskResponseDto {
  String? id;
  String? doctorId;
  String? patientId;
  String? title;
  String? description;
  int? frequencyPerDay;
  List<DetailReminderCareTaskResponseDto>? details;

  ReminderCareTaskResponseDto({
    this.id,
    this.doctorId,
    this.patientId,
    this.title,
    this.description,
    this.frequencyPerDay,
    this.details,
  });

  factory ReminderCareTaskResponseDto.fromJson(Map<String, dynamic> json) =>
      ReminderCareTaskResponseDto(
        id: json["id"],
        doctorId: json["doctor_id"],
        patientId: json["patient_id"],
        title: json["title"],
        description: json["description"],
        frequencyPerDay: json["frequency_per_day"],
        details: json["details"] == null
            ? []
            : List<DetailReminderCareTaskResponseDto>.from(
                json["details"]!.map(
                  (x) => DetailReminderCareTaskResponseDto.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_id": doctorId,
    "patient_id": patientId,
    "title": title,
    "description": description,
    "frequency_per_day": frequencyPerDay,
    "details": details == null
        ? []
        : List<dynamic>.from(details!.map((x) => x.toJson())),
  };
}

extension ReminderCareTaskResponseDtoExtension on ReminderCareTaskResponseDto {
  ReminderCareTask toReminderCareTask() {
    return ReminderCareTask(
      id: id ?? "",
      doctorId: doctorId ?? "",
      patientId: patientId ?? "",
      title: title ?? "",
      description: description ?? "",
      frequencyPerDay: frequencyPerDay ?? 0,
      details: details?.map((e) => e.toReminderCareTaskDetail()).toList() ?? [],
    );
  }
}
