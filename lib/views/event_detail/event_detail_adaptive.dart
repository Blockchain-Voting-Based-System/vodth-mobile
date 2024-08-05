part of 'event_detail_view.dart';

class _EventDetailAdaptive extends StatelessWidget {
  const _EventDetailAdaptive(this.viewModel);

  final EventDetailViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(context),
        bottomNavigationBar: _buildStartVotingButton(context),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      bottom: const TabBar(
        tabs: [
          Tab(text: 'Event'),
          Tab(text: 'Candidates'),
          Tab(text: 'Results'),
        ],
      ),
    );
  }

  _buildBody(BuildContext context) {
    return TabBarView(
      children: [
        _buildEventDetail(context),
        _buildCandidates(context),
        _buildResults(context),
      ],
    );
  }

  Widget _buildResults(BuildContext context) {
    return EventResult(viewModel: viewModel);
  }

  Widget _buildEventDetail(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEventBanner(),
          _buildEventInfo(context),
        ],
      ),
    );
  }

  Image _buildEventBanner() {
    return Image.network(
      viewModel.event?.imageUrl ?? 'https://via.placeholder.com/150',
      width: double.infinity,
      height: 200,
      fit: BoxFit.cover,
    );
  }

  Padding _buildEventInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                viewModel.event?.name ?? 'N/A',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Uri uri = Uri.parse('https://testnet.suivision.xyz/object/${viewModel.event?.suiEventId}');
                  await launchUrl(
                    uri,
                    mode: LaunchMode.inAppWebView,
                  );
                },
                child: Text(
                  'Live Sui Chain',
                  style: TextStyle(
                    fontSize: 16,
                    color: M3Color.of(context).primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            viewModel.event?.description ?? 'N/A',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildCandidates(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      shrinkWrap: true,
      children: viewModel.candidates != null
          ? [
              const Text(
                'Candidates',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
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

  GestureDetector _buildCandidate(BuildContext context, CandidateModel candidate) {
    return GestureDetector(
      onTap: () {
        context.pushRoute(
          CandidateDetailRoute(id: candidate.id),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: M3Color.of(context).primary, width: 1.0),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(8.0),
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(candidate.imageUrl ?? 'https://via.placeholder.com/150'),
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
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }

  Widget _buildStartVotingButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: M3Color.of(context).primary,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          onPressed: () {
            context.pushRoute(const CastingVoteRoute());
          },
          child: const Text(
            'Start Voting',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
