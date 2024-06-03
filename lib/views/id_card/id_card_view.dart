library idcard;

import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';

import 'id_card_view_model.dart';
part 'id_card_adaptive.dart';

@RoutePage()
class IdCardView extends StatelessWidget {
  const IdCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<IdCardViewModel>(
      create: (context) => IdCardViewModel(),
      builder: (context, viewModel, child) {
        return _IdCardAdaptive(viewModel);
      },
    );
  }
}
