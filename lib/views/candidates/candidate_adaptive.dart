part of 'candidate_view.dart';

class _CandidateAdaptive extends StatelessWidget {
  const _CandidateAdaptive(this.viewModel);

  final CandidateViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, viewModel.candidate?.name ?? 'N/A'),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Column(
              children: [
                buildCandidateProfileImage(context, viewModel),
                ConfigConstant.sizedBoxH2,
                ConfigConstant.sizedBoxH2,
                buildCandidateDetail(context, viewModel),
              ],
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context, String title) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: ThemeConstant.brandColor,
      title: Text(
        title,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }

  Widget buildCandidateProfileImage(BuildContext context, CandidateViewModel viewModel) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(viewModel.candidate?.imageName ?? ''),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildCandidateDetail(
    BuildContext context,
    CandidateViewModel viewModel,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              viewModel.candidate?.name ?? 'N/A',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
        ConfigConstant.sizedBoxH2,
        buildInfoSection(context, viewModel),
      ],
    );
  }

  Widget buildInfoSection(BuildContext context, CandidateViewModel viewModel) {
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
}
