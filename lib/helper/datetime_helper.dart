import 'package:intl/intl.dart';

class DateTimeHelper {
  static DateTime format() {
    // Analyzing every step with example time, do not delete

    // Date and Time Format
    final now = DateTime.now(); // 2022-09-18 18:33:06.841
    final dateFormat = DateFormat('y/M/d');
    const timeSpecific = "11:00:00";
    final completeFormat = DateFormat('y/M/d H:m:s');

    // Today Format
    final todayDate = dateFormat.format(now); // 2022/9/18
    final todayDateAndTime = "$todayDate $timeSpecific"; //2022/9/18 08:00:00
    var resultToday =
        completeFormat.parseStrict(todayDateAndTime); // 2022-09-18 08:00:00.000

    // Tomorrow Format
    var formatted =
        resultToday.add(const Duration(days: 1)); // 2022-09-19 08:00:00.000
    final tomorrowDate = dateFormat.format(formatted); // 2022/9/19
    final tomorrowDateAndTime =
        "$tomorrowDate $timeSpecific"; // 2022/9/19 08:00:00
    var resultTomorrow = completeFormat
        .parseStrict(tomorrowDateAndTime); // 2022-09-19 08:00:00.000

    // if DateTime.now() is after resultToday then return resultTomorrow else resultToday;
    // 2022-09-18 18:33:06.841 is after 2022-09-18 08:00:00.000 then 2022-09-18 08:00:00.000 else  2022-09-18 08:00:00.000
    return now.isAfter(resultToday) ? resultTomorrow : resultToday;
  }
}
