import 'package:intl/intl.dart';

class DateFormatUtil {
  static DateTime parseUtc(String date) {
    try {
      return DateTime.parse(date).toLocal();
    } catch (_) {
      return DateTime.now();
    }
  }

  static String formatDDMMYYYY(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String formatDDMMYYYYHHmmss(DateTime date) {
    return DateFormat('dd/MM/yyyy HH:mm:ss').format(date);
  }

  static String formatYYYY(DateTime date) {
    return DateFormat('yyyy').format(date);
  }

  static String formatUTC(DateTime dateTime) {
    try {
      var val = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
      final offset = dateTime.timeZoneOffset;
      final hours =
          offset.inHours > 0 ? offset.inHours : 1; // For fixing divide by 0

      if (!offset.isNegative) {
        val =
            "$val+${offset.inHours.toString().padLeft(2, '0')}${(offset.inMinutes % (hours * 60)).toString().padLeft(2, '0')}";
      } else {
        val =
            "$val-${(-offset.inHours).toString().padLeft(2, '0')}${(offset.inMinutes % (hours * 60)).toString().padLeft(2, '0')}";
      }
      return val;
    } catch (_) {
      return '';
    }
  }

  static String formatHHMM(DateTime date) {
    return DateFormat('HH:mm').format(date);
  }

  static String formatYYYYMMDDHHMM(DateTime date) {
    return DateFormat('hh:mm a dd/MM/yyyy').format(date);
  }

  static String formatHHMMA(DateTime date) {
    return DateFormat('hh:mm a').format(date);
  }

  static String getDifferenceTimeToNow(String? timestamp) {
    if (timestamp != null) {
      final DateTime now = DateTime.now();
      final DateTime targetDateTime = DateTime.parse(timestamp);

      final Duration difference = now.difference(targetDateTime);
      final int differenceInYears = difference.inDays ~/ 365;
      final int differenceInMonths = difference.inDays ~/ 30;
      final int differenceInWeeks = difference.inDays ~/ 7;

      if (differenceInYears != 0) {
        return '${differenceInYears.toString()} năm trước';
      }
      if (differenceInMonths != 0) {
        return '${differenceInMonths.toString()} tháng trước';
      }
      if (differenceInWeeks != 0) {
        return '${differenceInWeeks.toString()} tuần trước';
      }
      if (difference.inDays != 0) {
        return '${difference.inDays.toString()} ngày trước';
      }
      if ((difference.inHours % 24) != 0) {
        return '${(difference.inHours % 24).toString()} giờ trước';
      }
      if ((difference.inMinutes % 60) != 0) {
        return '${(difference.inMinutes % 60).toString()} phút trước';
      }
      return 'Vài giây trước';
    }
    return '';
  }
}
