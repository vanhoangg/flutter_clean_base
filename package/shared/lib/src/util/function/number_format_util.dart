import 'package:intl/intl.dart';

class NumberFormatUtil {
  static String formatCurrency(double money) {
    final oCcy = NumberFormat('#,##0', 'vi_VN');
    return oCcy.format(money);
  }

  static String formatDistance(double distance) {
    if (distance > 1000) {
      return '${(distance / 1000).toStringAsFixed(1)} km';
    }

    return '${distance.round()} m';
  }

  static String formatCount(int number) {
    if (number > 99) {
      return '99+';
    }

    return number.toString();
  }
}
