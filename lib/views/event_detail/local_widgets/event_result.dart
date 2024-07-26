import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';
import 'package:vodth_mobile/views/event_detail/event_detail_view_model.dart';

class EventResult extends StatelessWidget {
  const EventResult({super.key, required this.viewModel});

  final EventDetailViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          _buildTotalVotes(context),
          const SizedBox(height: 24),
          Text(
            tr('button.Vote_Ranking'),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildRankingTable(),
        ],
      ),
    );
  }

  Widget _buildTotalVotes(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          tr('button.Total_Votes'),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          viewModel.suiEventDetail?.fields['voted'].toString() ?? 'N/A',
          style: TextStyle(
            fontSize: 24,
            color: M3Color.of(context).primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildRankingTable() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: viewModel.candidates?.length,
      itemBuilder: (context, index) {
        CandidateModel? candidate = viewModel.candidates?[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: M3Color.of(context).primary, width: 1.0),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'No.${index + 1}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: M3Color.of(context).primary,
                  ),
                ),
                const SizedBox(width: 16),
                CircleAvatar(
                  radius: 32, // Image radius
                  backgroundImage: NetworkImage(candidate?.imageUrl ?? 'https://api.api-ninjas.com/v1/randomuser'),
                ),
              ],
            ),
            title: Text(
              candidate?.name ?? '',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: FutureBuilder(
              future: viewModel.candidateLiveVoteCount(candidate),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  return Text(
                    snapshot.data.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      color: M3Color.of(context).primary,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
