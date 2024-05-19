library candidates;

import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/views/candidates/local_widgets/candicadates_grid.dart';

import 'candidates_view_model.dart';
part 'candidates_adaptive.dart';

@RoutePage()
class CandidatesView extends StatelessWidget {
  const CandidatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CandidatesViewModel>(
      create: (context) => CandidatesViewModel(),
      builder: (context, viewModel, child) {
        return _CandidatesAdaptive(viewModel);
      },
    );
  }
}
