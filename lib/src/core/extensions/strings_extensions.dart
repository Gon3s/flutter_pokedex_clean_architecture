extension FormatIntToString on int {
  String format() {
    return toString().padLeft(3, '0');
  }
}

extension FormatString on String {
  String ucfirst() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
