library voteoption;

import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/theme/theme_constant.dart';

import 'vote_option_view_model.dart';
part 'vote_option_adaptive.dart';

@RoutePage()
class VoteOptionView extends StatelessWidget {
  const VoteOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<VoteOptionViewModel>(
      create: (context) => VoteOptionViewModel(),
      builder: (context, viewModel, child) {
        return _VoteOptionAdaptive(viewModel);
      },
    );
  }
}
