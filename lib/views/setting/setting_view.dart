library setting;

import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';

import 'setting_view_model.dart';
part 'setting_adaptive.dart';

@RoutePage()
class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SettingViewModel>(
      create: (context) => SettingViewModel(),
      builder: (context, viewModel, child) {
        return _SettingAdaptive(viewModel);
      },
    );
  }
}
