import 'package:intl/intl.dart';

class HumanFormats {
  static String humanReadableNumber(double value) {
    final formatterNumber = NumberFormat.compact().format(value);
    return formatterNumber;
  }
}