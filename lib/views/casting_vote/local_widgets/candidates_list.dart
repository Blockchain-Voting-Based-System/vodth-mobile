import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';
import 'package:vodth_mobile/views/casting_vote/casting_vote_view_model.dart';

class CandidatesList extends StatelessWidget {
  const CandidatesList({
    super.key,
    required this.viewModel,
  });

  final CastingVoteViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: viewModel.candidates!.length >= 5
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: viewModel.candidates != null
          ? [
              const SizedBox(height: 16),
              ...viewModel.candidates!.map(
                (candidate) {
                  return _buildCandidate(context, candidate);
                },
              ),
            ]
          : [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'No candidate',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
    );
  }

  Widget _buildCandidate(BuildContext context, CandidateModel candidate) {
    final bool isSelected = candidate == viewModel.selectedCandidate;

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
          viewModel.selectCandidate(candidate);
        },
        contentPadding: const EdgeInsets.all(8.0),
        leading: CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage(
              candidate.imageUrl ?? 'https://via.placeholder.com/150'),
        ),
        title: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            candidate.name ?? 'N/A',
            style: const TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        trailing: Radio<CandidateModel>(
          value: candidate,
          groupValue: viewModel.selectedCandidate,
          onChanged: (CandidateModel? value) {
            viewModel.selectCandidate(value);
          },
        ),
      ),
    );
  }
}
