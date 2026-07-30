import 'reminder_care_task_detail.dart';

class ReminderCareTask {
  String id;
  String doctorId;
  String patientId;
  String title;
  String description;
  int frequencyPerDay;
  List<ReminderCareTaskDetail> details;

  ReminderCareTask({
    required this.id,
    required this.doctorId,
    required this.patientId,
    required this.title,
    required this.description,
    required this.frequencyPerDay,
    required this.details,
  });
}
