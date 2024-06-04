library register;

import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';

import 'register_view_model.dart';
part 'register_adaptive.dart';

@RoutePage()
class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<RegisterViewModel>(
      create: (context) => RegisterViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: _RegisterAdaptive(viewModel),
        );
      },
    );
  }
}
