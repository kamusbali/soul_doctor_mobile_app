import 'reminder_care_task_detail.dart';

enum CareTaskStatus {
  pending,
  upcoming,
  missed;

  String getName() {
    switch (this) {
      case CareTaskStatus.pending:
        return "Pending";
      case CareTaskStatus.upcoming:
        return "Upcoming";
      case CareTaskStatus.missed:
        return "Missed";
    }
  }
}

extension ReminderCareTaskDetailStatusX on ReminderCareTaskDetail {
  /// Null when the task is already done - it no longer belongs to any of
  /// the pending/upcoming/missed tabs.
  CareTaskStatus? get careTaskStatus {
    if (isDone) return null;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final scheduledDate = DateTime(date.year, date.month, date.day);

    if (scheduledDate.isBefore(today)) return CareTaskStatus.missed;
    if (scheduledDate.isAfter(today)) return CareTaskStatus.upcoming;
    return CareTaskStatus.pending;
  }
}
