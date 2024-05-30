import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/theme/m3/m3_opacity.dart';
import 'package:vodth_mobile/core/theme/m3/m3_tonal.dart';

extension ColorExtension on Color {
  M3Opacity get m3Opacity {
    return M3Opacity(this);
  }

  M3Tonal get m3Tonal {
    return M3Tonal(this);
  }

  Color get foregroundColor {
    if (ThemeData.estimateBrightnessForColor(this) == Brightness.dark) {
      return Colors.white;
    }
    return Colors.black;
  }

  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  String get hex {
    return '#${value.toRadixString(16).padLeft(6, '0').replaceFirst('ff', '')}';
  }
}
