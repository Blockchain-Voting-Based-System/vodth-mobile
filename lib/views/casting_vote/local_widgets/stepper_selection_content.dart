import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';
import 'package:vodth_mobile/views/casting_vote/casting_vote_view_model.dart';
import 'package:vodth_mobile/views/casting_vote/local_widgets/candidates_list.dart';
import 'package:vodth_mobile/views/casting_vote/local_widgets/content_section.dart';
import 'package:vodth_mobile/views/casting_vote/local_widgets/title_section.dart';

class StepperSelectionContent extends StatelessWidget {
  const StepperSelectionContent({
    super.key,
    required this.viewModel,
  });

  final CastingVoteViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Divider(thickness: 2, color: M3Color.of(context).primary),
        const SizedBox(height: 8),
        const TitleSection(
          title: 'Candidates',
        ),
        ContentSection(
          inputWidget: CandidatesList(viewModel: viewModel),
        ),
      ],
    );
  }
}
