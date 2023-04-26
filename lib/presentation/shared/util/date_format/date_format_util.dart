import 'package:intl/intl.dart';

class TimeUtil {
  static String formatDayTime(DateTime dateTime) {
    final dateFormat = DateFormat('EEEE, d MMMM y', 'id_ID');
    return dateFormat.format(dateTime);
  }

  static String formatHourTime(DateTime dateTime) {
    final timeFormat = DateFormat('hh:mm a');
    return timeFormat.format(dateTime);
  }
}
