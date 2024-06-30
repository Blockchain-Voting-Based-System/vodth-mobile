library candidate;

import 'package:vodth_mobile/constant/config_constant.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/themes/theme_constant.dart';

import 'candidate_view_model.dart';
part 'candidate_adaptive.dart';

@RoutePage()
class CandidateView extends StatelessWidget {
  const CandidateView({super.key, this.candidate});

  final CandidateModel? candidate;

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CandidateViewModel>(
      create: (context) => CandidateViewModel(candidate: candidate),
      builder: (context, viewModel, child) {
        return _CandidateAdaptive(viewModel);
      },
    );
  }
}
