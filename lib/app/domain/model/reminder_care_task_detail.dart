class ReminderCareTaskDetail {
  String id;
  String taskReminderId;
  DateTime date;
  int order;
  bool isDone;

  ReminderCareTaskDetail({
    required this.id,
    required this.taskReminderId,
    required this.date,
    required this.order,
    required this.isDone,
  });
}
