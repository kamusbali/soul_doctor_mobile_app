// To parse this JSON data, do
//
//     final reminderCareTaskResponseDto = reminderCareTaskResponseDtoFromJson(jsonString);

import 'package:soul_doctor/app/domain/model/reminder_care_task_detail.dart';

class DetailReminderCareTaskResponseDto {
  String? id;
  String? taskReminderId;
  DateTime? date;
  int? order;
  bool? isDone;

  DetailReminderCareTaskResponseDto({
    this.id,
    this.taskReminderId,
    this.date,
    this.order,
    this.isDone,
  });

  factory DetailReminderCareTaskResponseDto.fromJson(
    Map<String, dynamic> json,
  ) => DetailReminderCareTaskResponseDto(
    id: json["id"],
    taskReminderId: json["task_reminder_id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    order: json["order"],
    isDone: json["is_done"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "task_reminder_id": taskReminderId,
    "date": date == null
        ? null
        : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "order": order,
    "is_done": isDone,
  };
}

extension DetailReminderCareTaskResponseDtoConversion
    on DetailReminderCareTaskResponseDto {
  ReminderCareTaskDetail toReminderCareTaskDetail() {
    return ReminderCareTaskDetail(
      id: id ?? "",
      taskReminderId: taskReminderId ?? "",
      date: date ?? DateTime.now(),
      order: order ?? 0,
      isDone: isDone ?? false,
    );
  }
}
