library welcome;

import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';

import 'welcome_view_model.dart';
part 'welcome_adaptive.dart';

@RoutePage()
class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<WelcomeViewModel>(
      create: (context) => WelcomeViewModel(),
      builder: (context, viewModel, child) {
        return _WelcomeAdaptive(viewModel);
      },
    );
  }
}
