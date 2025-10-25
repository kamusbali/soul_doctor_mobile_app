import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static String dateToDayMonthYear(DateTime dateTime) {
    return DateFormat.yMMMMd(Get.locale?.languageCode).format(dateTime);
  }
}
