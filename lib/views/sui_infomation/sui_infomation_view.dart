library sui_infomation;

import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';

import 'sui_infomation_view_model.dart';
part 'sui_infomation_adaptive.dart';

@RoutePage()
class SuiInfomationView extends StatelessWidget {
  const SuiInfomationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SuiInfomationViewModel>(
      create: (context) => SuiInfomationViewModel(),
      builder: (context, viewModel, child) {
        return _SuiInfomationAdaptive(viewModel);
      },
    );
  }
}
