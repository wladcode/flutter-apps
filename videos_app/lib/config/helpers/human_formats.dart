import 'package:intl/intl.dart';

class HumanFormats {
  static String humanReadableNumber(double value) {
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(value);
    return formatterNumber;
  }
}