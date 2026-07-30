// To parse this JSON data, do
//
//     final reminderCareTaskResponseDto = reminderCareTaskResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/data/source/remote/dto/response/reminder_care_task_response_dto.dart';

import '../../../../../domain/model/reminder_care_task.dart';

ReminderCareTasksResponseDto reminderCareTaskResponseDtoFromJson(String str) =>
    ReminderCareTasksResponseDto.fromJson(json.decode(str));

String reminderCareTaskResponseDtoToJson(ReminderCareTasksResponseDto data) =>
    json.encode(data.toJson());

class ReminderCareTasksResponseDto {
  List<ReminderCareTaskResponseDto>? reminders;

  ReminderCareTasksResponseDto({this.reminders});

  factory ReminderCareTasksResponseDto.fromJson(Map<String, dynamic> json) =>
      ReminderCareTasksResponseDto(
        reminders: json["reminders"] == null
            ? []
            : List<ReminderCareTaskResponseDto>.from(
                json["reminders"]!.map(
                  (x) => ReminderCareTaskResponseDto.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
    "reminders": reminders == null
        ? []
        : List<dynamic>.from(reminders!.map((x) => x.toJson())),
  };
}

extension ReminderCareTasksResponseDtoConversion
    on ReminderCareTasksResponseDto {
  List<ReminderCareTask> toListReminderCareTask() {
    return reminders?.map((e) => e.toReminderCareTask()).toList() ?? [];
  }
}
