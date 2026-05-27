import 'dart:convert';

import '../../../../domain/model/calendar_reminder.dart';
import '../../../../domain/model/repeat_calendar_reminder.dart';

CalendarReminderLocalDto calendarReminderDtoFromJson(String str) =>
    CalendarReminderLocalDto.fromJson(json.decode(str));

String calendarReminderDtoToJson(CalendarReminderLocalDto data) =>
    json.encode(data.toJson());

class CalendarReminderLocalDto {
  String? id;
  String? title;
  String? description;
  DateTime? dateTime;
  bool? isSynced; // New field to track synchronization status
  int? repeatInterval; // New field to track repeat interval in days
  List<DateTime>?
  isDoneDateTime; // New field to track if the reminder is active

  CalendarReminderLocalDto({
    this.id,
    this.title,
    this.description,
    this.dateTime,
    this.isSynced,
    this.repeatInterval,
    this.isDoneDateTime,
  });

  factory CalendarReminderLocalDto.fromJson(Map<String, dynamic> json) =>
      CalendarReminderLocalDto(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        dateTime: json["datetime"] == null
            ? null
            : DateTime.parse(json["datetime"]),
        isSynced:
            json["is_synced"] ?? false, // Default to false if not provided
        repeatInterval: json["repeat_interval"],
        isDoneDateTime: json["is_done_date_time"] == null
            ? null
            : List<DateTime>.from(
                json["is_done_date_time"].map((x) => DateTime.parse(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "datetime": dateTime?.toIso8601String(),
    "is_synced": isSynced ?? false, // Default to false if null
    "repeat_interval": repeatInterval,
    "is_done_date_time": isDoneDateTime
        ?.map((x) => x.toIso8601String())
        .toList(),
  };
}

extension CalendarReminderLocalDtoExtension on CalendarReminderLocalDto {
  CalendarReminder toCalendarReminder() {
    print(
      "Mengonversi CalendarReminderLocalDto ke CalendarReminder dengan id: $id, title: $title, description: $description, dateTime: $dateTime, repeatInterval: $repeatInterval, isDoneDateTime: $isDoneDateTime",
    );
    return CalendarReminder(
      id: id ?? '',
      title: title ?? '',
      description: description ?? '',
      dateTime: dateTime ?? DateTime.now(),
      repeatInterval: RepeatCalendarReminder.getRepeatCalendarReminderById(
        repeatInterval ?? 0,
      ),
      isDoneDateTime: isDoneDateTime ?? [],
    );
  }
}
