import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/theme/m3/m3_read_only_color.dart';

extension ColorSchemeExtension on ColorScheme {
  M3ReadOnlyColor get readOnly => M3ReadOnlyColor(this);
}
