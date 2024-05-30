import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/theme/theme_config.dart';

class ThemeProvider extends BaseViewModel {
  ThemeData get lightTheme => ThemeConfig.light().themeData;
  ThemeMode get themeMode => ThemeMode.light;
}
