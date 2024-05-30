import 'dart:ui';

extension StringExtension on String {
  String get capitalize {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  Color toColor({
    required Color fallback,
  }) {
    try {
      return Color(int.parse(substring(1, 7), radix: 16) + 0xFF000000);
    } catch (e) {
      return fallback;
    }
  }
}
