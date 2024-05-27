library main_screen;

import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/views/main_screen/local_widgets/bottom_nav_bar.dart';

import 'main_screen_view_model.dart';
part 'main_screen_adaptive.dart';

@RoutePage()
class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<MainScreenViewModel>(
      create: (context) => MainScreenViewModel(),
      builder: (context, viewModel, child) {
        return _MainScreenAdaptive(viewModel);
      },
    );
  }
}
