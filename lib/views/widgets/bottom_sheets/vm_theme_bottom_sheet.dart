import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vodth_mobile/providers/theme_provider.dart';
import 'package:vodth_mobile/views/widgets/bottom_sheets/vm_bottom_sheet.dart';
import 'package:vodth_mobile/views/widgets/util_widgets/vm_single_state_widget.dart';
import 'package:vodth_mobile/views/widgets/vm_bottom.dart';
import 'package:vodth_mobile/views/widgets/vm_bottom_navigation_wrapper.dart';

class VmThemeBottomSheet extends VmBottomSheet {
  @override
  String? get title => tr('alert_sheet.choose_theme');

  @override
  bool get includePlatformBottomPadding => false;

  @override
  Widget Function(BuildContext context) get contentBuilder {
    return (context) {
      return buildContent(context);
    };
  }

  Widget buildContent(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return VmSingleStateWidget<ThemeMode>(
      initialValue: themeProvider.themeMode,
      builder: (context, notifier) {
        return ValueListenableBuilder<ThemeMode>(
          valueListenable: notifier,
          builder: (context, themeMode, chld) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildThemeTile(notifier, ThemeMode.light, tr('theme.light')),
                _buildThemeTile(notifier, ThemeMode.dark, tr('theme.dark')),
                buildActionButton(context, notifier),
              ],
            );
          },
        );
      },
    );
  }

  Widget buildActionButton(BuildContext context, ValueNotifier<ThemeMode> notifier) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return VmBottomNavigationWrapper.singleAction(
      VmButton.filled(
        label: tr('button.apply'),
        onPressed: notifier.value == themeProvider.themeMode
            ? null
            : () {
                themeProvider.setThemeMode(notifier.value);
                Navigator.of(context).pop();
              },
      ),
    );
  }

  Widget _buildThemeTile(ValueNotifier<ThemeMode> notifier, ThemeMode themeMode, String title) {
    return buildThemeTile(
      themeMode,
      notifier.value,
      title,
      () => notifier.value = themeMode,
    );
  }

  static Widget buildThemeTile(
    ThemeMode themeMode,
    ThemeMode currentThemeMode,
    String title,
    void Function() onTap,
  ) {
    return ListTile(
      leading: Icon(themeMode == ThemeMode.light ? Icons.wb_sunny : Icons.nights_stay),
      title: Text(title),
      onTap: () => onTap(),
      trailing: Radio<ThemeMode>(
        value: themeMode,
        groupValue: currentThemeMode,
        onChanged: (value) {
          if (value == null) return;
          onTap();
        },
      ),
    );
  }
}
