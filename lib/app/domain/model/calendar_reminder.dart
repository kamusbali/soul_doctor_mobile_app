import 'repeat_calendar_reminder.dart';

class CalendarReminder {
  final String id;
  final String title;
  final String? description;
  final DateTime dateTime;
  final RepeatCalendarReminder repeatInterval;
  final List<DateTime> isDoneDateTime;
  final bool isSynced; // New field to track synchronization status

  CalendarReminder({
    required this.id,
    required this.title,
    this.description,
    required this.dateTime,
    required this.repeatInterval,
    required this.isDoneDateTime,
    this.isSynced = false, // Default to false for new reminders
  });
}
