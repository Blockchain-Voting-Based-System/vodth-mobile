library candidate_page;

import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';

import 'candidate_page_view_model.dart';
part 'candidate_page_adaptive.dart';

@RoutePage()
class CandidatePageView extends StatelessWidget {
  const CandidatePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CandidatePageViewModel>(
      create: (context) => CandidatePageViewModel(),
      builder: (context, viewModel, child) {
        return _CandidatePageAdaptive(viewModel);
      },
    );
  }
}
