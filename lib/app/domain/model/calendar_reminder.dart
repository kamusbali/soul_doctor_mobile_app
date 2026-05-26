class CalendarReminder {
  final String id;
  final String title;
  final String? description;
  final DateTime dateTime;

  CalendarReminder({
    required this.id,
    required this.title,
    this.description,
    required this.dateTime,
  });
}
