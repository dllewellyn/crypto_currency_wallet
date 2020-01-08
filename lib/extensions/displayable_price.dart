extension StringExtension on String {
  get toDisplayablePrice => Utils.toDisplayablePrice(this);
}

class Utils {
  static String toDisplayablePrice(String input) => double.parse(input) < 1
      ? double.parse(input).toStringAsPrecision(5)
      : input;
}
