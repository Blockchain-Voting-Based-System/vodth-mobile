import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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

  // Widget _buildPieChart(context) {
  //   return PieChart(
  //     dataMap: viewModel.candidateVotes,
  //     chartType: ChartType.disc,
  //     animationDuration: const Duration(milliseconds: 800),
  //     chartLegendSpacing: 48,
  //     colorList: const [
  //       Colors.blueAccent,
  //       Colors.yellowAccent,
  //       Colors.greenAccent,
  //     ],
  //     legendOptions: const LegendOptions(
  //       showLegends: false,
  //       legendPosition: LegendPosition.right,
  //     ),
  //     chartValuesOptions: const ChartValuesOptions(
  //       showChartValueBackground: false,
  //       showChartValues: true,
  //       showChartValuesOutside: false,
  //       // decimalPlaces: 2,
  //       showChartValuesInPercentage: true,
  //     ),
  //     chartRadius: MediaQuery.of(context).size.width / 2.5,
  //   );
  // }

  Widget _buildTotalVotes(context) {
    return FutureBuilder(
      future: viewModel.eventLiveVoteCount(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Text(
            'Total Votes: ${snapshot.data.toString()}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: M3Color.of(context).primary,
            ),
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  Widget _buildRankingTable() {
    List<MapEntry<String, double>> sortedEntries = viewModel.candidateVotes.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: sortedEntries.length,
      itemBuilder: (context, index) {
        final entry = sortedEntries[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: M3Color.of(context).primary, width: 1.0),
          ),
          child: ListTile(
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
                const CircleAvatar(
                  radius: 32, // Image radius
                  backgroundImage: AssetImage('assets/images/yura.png'),
                ),
              ],
            ),
            title: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                entry.key,
                style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ),
            trailing: Text(
              '${(entry.value / viewModel.totalVotes * 100).toStringAsFixed(2)}%',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            onTap: () {
              // context.router.push(const CandidatePageRoute());
            },
          ),
        );
      },
    );
  }
}
