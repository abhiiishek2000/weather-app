import 'package:intl/intl.dart';

class AppDateFormatter {
  static final _hourlyFormate = DateFormat('h a');
  static final _dailyFormate = DateFormat('EEEE');

  static String formatTimeShort(DateTime dateTime) {
    return _hourlyFormate.format(dateTime);
  }

  static String formatDay(DateTime dateTime) {
    return _dailyFormate.format(dateTime);
  }
}
