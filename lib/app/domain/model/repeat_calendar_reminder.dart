enum RepeatCalendarReminder {
  none,
  daily,
  weekly,
  monthly,
  yearly;

  String get name {
    switch (this) {
      case RepeatCalendarReminder.none:
        return "Tidak Berulang";
      case RepeatCalendarReminder.daily:
        return "Setiap Hari";
      case RepeatCalendarReminder.weekly:
        return "Setiap Minggu";
      case RepeatCalendarReminder.monthly:
        return "Setiap Bulan";
      case RepeatCalendarReminder.yearly:
        return "Setiap Tahun";
    }
  }

  int get id {
    switch (this) {
      case RepeatCalendarReminder.none:
        return 0;
      case RepeatCalendarReminder.daily:
        return 1;
      case RepeatCalendarReminder.weekly:
        return 2;
      case RepeatCalendarReminder.monthly:
        return 3;
      case RepeatCalendarReminder.yearly:
        return 4;
    }
  }

  static RepeatCalendarReminder getRepeatCalendarReminderById(int id) {
    switch (id) {
      case 0:
        return RepeatCalendarReminder.none;
      case 1:
        return RepeatCalendarReminder.daily;
      case 2:
        return RepeatCalendarReminder.weekly;
      case 3:
        return RepeatCalendarReminder.monthly;
      case 4:
        return RepeatCalendarReminder.yearly;
      default:
        return RepeatCalendarReminder.none;
    }
  }
}
