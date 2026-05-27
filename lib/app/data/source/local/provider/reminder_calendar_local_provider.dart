import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

import '../../../../core/error/failure.dart';
import '../dto/calendar_reminder_local_dto.dart';

class ReminderCalendarLocalProvider {
  ReminderCalendarLocalProvider._internal();
  static final ReminderCalendarLocalProvider _instance =
      ReminderCalendarLocalProvider._internal();
  static ReminderCalendarLocalProvider get instance => _instance;

  final Box _consultationBox = Hive.box('reminder_calendar');

  Future<void> addReminderCalendarData({
    required String title,
    required String description,
    required DateTime dateTime,
    required int repeatInterval,
    required List<DateTime> isDoneDateTime,
  }) async {
    print("Menambah data reminder calendar");

    await _consultationBox.put(
      DateTime.now().millisecondsSinceEpoch.toString(),
      CalendarReminderLocalDto(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        description: description,
        dateTime: dateTime,
        repeatInterval: repeatInterval,
        isSynced: false,
        isDoneDateTime: isDoneDateTime,
      ).toJson(),
    );
  }

  Either<Failure, List<CalendarReminderLocalDto>> getAllReminderCalendarData() {
    try {
      final data = _consultationBox.values
          .map(
            (e) =>
                CalendarReminderLocalDto.fromJson(Map<String, dynamic>.from(e)),
          )
          .toList();

      return Right(data);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<void> deleteReminderCalendarData(String id) async {
    print("Menghapus data reminder calendar dengan id: $id");
    await _consultationBox.delete(id);
  }

  Future<void> updateReminderCalendarData({
    required String id,
    required String title,
    required String description,
    required bool isSynced,
    required int repeatInterval,
    required DateTime dateTime,
    required List<DateTime> isDoneDateTime,
  }) async {
    print(
      "Memperbarui data reminder calendar dengan id: $id dan title: $title, description: $description, dateTime: $dateTime, repeatInterval: $repeatInterval, isDoneDateTime: $isDoneDateTime",
    );

    await _consultationBox.put(
      id,
      CalendarReminderLocalDto(
        id: id,
        title: title,
        description: description,
        isSynced: isSynced,
        repeatInterval: repeatInterval,
        dateTime: dateTime,
        isDoneDateTime: isDoneDateTime,
      ).toJson(),
    );
  }
}
