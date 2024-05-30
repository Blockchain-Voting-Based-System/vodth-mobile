library test;

import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';

import 'test_view_model.dart';
part 'test_adaptive.dart';

@RoutePage()
class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<TestViewModel>(
      create: (context) => TestViewModel(),
      builder: (context, viewModel, child) {
        return _TestAdaptive(viewModel);
      },
    );
  }
}
