import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static String dateToDayMonthYear(DateTime dateTime) {
    return DateFormat.yMMMMd(Get.locale?.languageCode).format(dateTime);
  }

  static String onlyDate(DateTime dateTime) {
    return "${dateTime.year.toString().padLeft(4, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
  }

  static String formatSecondsToTime(int totalSeconds) {
    // Create a Duration object from the total seconds
    Duration duration = Duration(seconds: totalSeconds);

    // Extract hours, minutes, and remaining seconds
    int minutes = duration.inMinutes.remainder(
      60,
    ); // Remainder after extracting full hours
    int seconds = duration.inSeconds.remainder(
      60,
    ); // Remainder after extracting full minutes

    // Format with leading zeros if necessary
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    // Return the formatted string
    return '$minutesStr:$secondsStr';
  }
}
