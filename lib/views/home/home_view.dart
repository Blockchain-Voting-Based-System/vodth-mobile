library home;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';
import 'package:vodth_mobile/core/theme/m3/m3_text_theme.dart';
import 'package:vodth_mobile/views/home/local_widgets/events_list.dart';
import 'package:vodth_mobile/views/widgets/vm_tap_effect.dart';

import 'home_view_model.dart';

part 'home_adaptive.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
      builder: (context, viewModel, child) {
        return _HomeAdaptive(viewModel);
      },
    );
  }
}
