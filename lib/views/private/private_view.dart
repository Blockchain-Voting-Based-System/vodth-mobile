library private;

import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/views/private/local_widgets/number_pad.dart';

import 'private_view_model.dart';
part 'private_adaptive.dart';

@RoutePage()
class PrivateView extends StatelessWidget {
  const PrivateView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<PrivateViewModel>(
      create: (context) => PrivateViewModel(),
      builder: (context, viewModel, child) {
        return _PrivateAdaptive(viewModel);
      },
    );
  }
}
