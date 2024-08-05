import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';
import 'package:vodth_mobile/providers/voting_provider.dart';
import 'package:vodth_mobile/views/casting_vote/casting_vote_view_model.dart';
import 'package:vodth_mobile/views/widgets/util_widgets/vm_single_state_widget.dart';

class CandidatesList extends StatelessWidget {
  const CandidatesList({
    super.key,
    required this.viewModel,
  });

  final CastingVoteViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return VmSingleStateWidget<String?>(
      builder: (context, notifier) {
        return ValueListenableBuilder(
          valueListenable: ValueNotifier(viewModel.selectedCandidate),
          builder: (context, candidate, _) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: viewModel.candidates?.length,
              itemBuilder: (context, index) {
                if (viewModel.candidates == null) {
                  return const Text('No candidates found');
                }
                return _buildCandidate(context, viewModel.candidates![index]);
              },
            );
          },
        );
      },
      initialValue: null,
    );
  }

  Widget _buildCandidate(BuildContext context, CandidateModel candidate) {
    VotingProvider votingProvider = context.read<VotingProvider>();
    final bool isSelected = candidate.suiCandidateId == votingProvider.selectedCandidate;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: isSelected ? M3Color.of(context).primary : Colors.grey,
          width: 1.0,
        ),
      ),
      child: ListTile(
        onTap: () {
          votingProvider.selectCandidate(candidate.suiCandidateId);
        },
        contentPadding: const EdgeInsets.all(8.0),
        leading: CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage(candidate.imageUrl ?? 'https://via.placeholder.com/150'),
        ),
        title: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            candidate.name ?? 'N/A',
            style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        trailing: Radio(
          value: candidate.suiCandidateId,
          groupValue: votingProvider.selectedCandidate,
          onChanged: (_) {},
        ),
      ),
    );
  }
}
