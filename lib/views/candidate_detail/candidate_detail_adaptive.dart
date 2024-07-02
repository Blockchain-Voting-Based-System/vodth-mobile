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
          label: 'Vote',
          onPressed: () async {
            if (viewModel.event?.type == 'private') {
              _showSecretKeyDialog(context);
            } else if (viewModel.event?.type == 'public') {
              MessengerService.of(context).showBlankLoading(
                future: () async {
                  await viewModel.voteCandidate();
                },
                debugSource: "CandidateDetailViewModel#voteCandidate",
              );
              context.router.popForced();
            }
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
          return Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Column(
                  children: [
                    buildCandidateProfileImage(context),
                    ConfigConstant.sizedBoxH2,
                    buildCandidateDetail(context),
                  ],
                ),
              ],
            ),
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
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(viewModel.candidate?.imageUrl ?? 'https://via.placeholder.com/150'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildCandidateDetail(
    BuildContext context,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              viewModel.candidate != null ? '${viewModel.candidate?.name}' : 'N/A',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
        ConfigConstant.sizedBoxH2,
        buildInfoSection(context),
      ],
    );
  }

  Widget buildInfoSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Presedent of CADT',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontStyle: FontStyle.italic,
                      overflow: TextOverflow.ellipsis,
                    ),
              ),
            ),
          ],
        ),
        ConfigConstant.sizedBoxH1,
        Text(
          viewModel.candidate?.bio ?? 'N/A',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: ThemeConstant.brandColor,
                fontSize: 20,
              ),
        ),
      ],
    );
  }

  void _showSecretKeyDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PrivateVoteSecretDialog(controller: controller, viewModel: viewModel);
      },
    );
  }
}
