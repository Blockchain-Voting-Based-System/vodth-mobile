library about_us;

import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';

import 'about_us_view_model.dart';
part 'about_us_adaptive.dart';

@RoutePage()
class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<AboutUsViewModel>(
      create: (context) => AboutUsViewModel(),
      builder: (context, viewModel, child) {
        return _AboutUsAdaptive(viewModel);
      },
    );
  }
}
