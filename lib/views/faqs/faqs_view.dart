library faqs;

import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';

import 'faqs_view_model.dart';
part 'faqs_adaptive.dart';

@RoutePage()
class FaqsView extends StatelessWidget {
  const FaqsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<FaqsViewModel>(
      create: (context) => FaqsViewModel(),
      builder: (context, viewModel, child) {
        return _FaqsAdaptive(viewModel);
      },
    );
  }
}
