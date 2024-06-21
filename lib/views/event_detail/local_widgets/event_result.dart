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
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // _buildPieChart(context),
          const SizedBox(height: 24),
          _buildTotalVotes(context),
          const SizedBox(height: 24),
          const Text(
            'Vote Ranking',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
        const Text(
          'Total Votes',
          style: TextStyle(
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
    if (viewModel.candidates == null) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'No candidate',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: viewModel.candidates?.length,
        itemBuilder: (context, index) {
          CandidateModel candidate = viewModel.candidates![index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: M3Color.of(context).primary, width: 1.0),
            ),
            child: _buildCandidateTile(index, context, candidate),
          );
        },
      );
    }
  }

  ListTile _buildCandidateTile(int index, BuildContext context, CandidateModel candidate) {
    return ListTile(
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
            backgroundImage: Image.network(candidate.imageUrl ?? '').image,
          ),
        ],
      ),
      title: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          candidate.name ?? 'N/A',
          style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      trailing: StreamBuilder(
        stream: viewModel.getCandidateVoteCount(candidate.suiCandidateId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              snapshot.data.toString(),
              style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
