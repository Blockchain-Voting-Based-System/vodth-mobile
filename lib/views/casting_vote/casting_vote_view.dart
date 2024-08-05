library casting_vote;

import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/views/casting_vote/local_widgets/stepper_selection_content.dart';
import 'package:vodth_mobile/views/casting_vote/local_widgets/stepper_identity_content.dart';
import 'package:vodth_mobile/views/casting_vote/local_widgets/stepper_vote_content.dart';

import 'casting_vote_view_model.dart';

part 'casting_vote_adaptive.dart';

@RoutePage()
class CastingVoteView extends StatelessWidget {
  final List<CandidateModel> candidates;

  const CastingVoteView({
    super.key,
    required this.candidates,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CastingVoteViewModel>(
      create: (context) => CastingVoteViewModel(
        candidates: candidates,
      ),
      builder: (context, viewModel, child) {
        return _CastingVoteAdaptive(viewModel);
      },
    );
  }
}
