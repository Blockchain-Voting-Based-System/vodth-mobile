part of 'candidate_detail_view.dart';

class _CandidateDetailAdaptive extends StatelessWidget {
  const _CandidateDetailAdaptive(this.viewModel);

  final CandidateDetailViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MorphingAppBar(),
      body: _buildBody(context),
      bottomNavigationBar: VmBottomNavigationWrapper(
        child: VmButton.filled(
          label: 'Start Voting',
          onPressed: () async {
            context.pushRoute(CastingVoteRoute(event: viewModel.event ?? EventModel()));
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return FutureBuilder(
      builder: (context, _) {
        if (viewModel.candidate == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              buildCandidateProfileImage(context),
              ConfigConstant.sizedBoxH2,
              buildCandidateDetail(context),
            ],
          );
        }
      },
      future: viewModel.load(),
    );
  }

  Widget buildCandidateProfileImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.25,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(viewModel.candidate?.imageUrl ?? 'https://via.placeholder.com/150'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildCandidateDetail(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context),
          _buildInfoSection(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            viewModel.candidate != null ? '${viewModel.candidate?.name}' : 'N/A',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        GestureDetector(
          onTap: () async {
            Uri uri = Uri.parse('https://testnet.suivision.xyz/object/${viewModel.candidate?.suiCandidateId}');
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
    );
  }

  Widget _buildInfoSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConfigConstant.sizedBoxH2,
        _buildDemographicTile(title: 'Born Date: ', value: viewModel.candidate?.birthday ?? 'N/A'),
        const SizedBox(height: 4),
        _buildDemographicTile(title: 'Gender: ', value: viewModel.candidate?.sex ?? 'N/A'),
        const SizedBox(height: 24),
        Text(
          viewModel.candidate?.bio ?? 'N/A',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Row _buildDemographicTile({required String title, required String value}) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
