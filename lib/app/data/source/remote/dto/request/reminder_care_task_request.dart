// To parse this JSON data, do
//
//     final reminderCareTaskRequest = reminderCareTaskRequestFromJson(jsonString);

import 'dart:convert';

ReminderCareTaskRequest reminderCareTaskRequestFromJson(String str) =>
    ReminderCareTaskRequest.fromJson(json.decode(str));

String reminderCareTaskRequestToJson(ReminderCareTaskRequest data) =>
    json.encode(data.toJson());

class ReminderCareTaskRequest {
  String? patientId;
  DateTime? startDate;
  DateTime? endDate;
  String? title;
  String? description;
  int? frequencyPerDay;

  ReminderCareTaskRequest({
    this.patientId,
    this.startDate,
    this.endDate,
    this.title,
    this.description,
    this.frequencyPerDay,
  });

  factory ReminderCareTaskRequest.fromJson(Map<String, dynamic> json) =>
      ReminderCareTaskRequest(
        patientId: json["patient_id"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null
            ? null
            : DateTime.parse(json["end_date"]),
        title: json["title"],
        description: json["description"],
        frequencyPerDay: json["frequency_per_day"],
      );

  Map<String, dynamic> toJson() => {
    "patient_id": patientId,
    "start_date": startDate == null
        ? null
        : "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "end_date": endDate == null
        ? null
        : "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
    "title": title,
    "description": description,
    "frequency_per_day": frequencyPerDay,
  };
}
