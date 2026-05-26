import 'dart:convert';

import '../../../../domain/model/calendar_reminder.dart';

CalendarReminderLocalDto calendarReminderDtoFromJson(String str) =>
    CalendarReminderLocalDto.fromJson(json.decode(str));

String calendarReminderDtoToJson(CalendarReminderLocalDto data) =>
    json.encode(data.toJson());

class CalendarReminderLocalDto {
  String? id;
  String? title;
  String? description;
  DateTime? dateTime;

  CalendarReminderLocalDto({
    this.id,
    this.title,
    this.description,
    this.dateTime,
  });

  factory CalendarReminderLocalDto.fromJson(Map<String, dynamic> json) =>
      CalendarReminderLocalDto(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        dateTime: json["datetime"] == null
            ? null
            : DateTime.parse(json["datetime"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "datetime": dateTime?.toIso8601String(),
  };
}

extension CalendarReminderLocalDtoExtension on CalendarReminderLocalDto {
  CalendarReminder toCalendarReminder() {
    return CalendarReminder(
      id: id ?? '',
      title: title ?? '',
      description: description ?? '',
      dateTime: dateTime ?? DateTime.now(),
    );
  }
}
