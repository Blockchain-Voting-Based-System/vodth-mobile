part of 'history_view.dart';

class _HistoryAdaptive extends StatelessWidget {
  const _HistoryAdaptive(this.viewModel);

  final HistoryViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MorphingAppBar(
        title: Text(
          'Vote History',
          style: M3TextTheme.of(context).titleLarge?.copyWith(
                color: M3Color.of(context).primary,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: _buildBody(context),
    );
  }

  // Widget _buildBody(BuildContext context) {
  //   return ListView(
  //     padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
  //     children: [
  //       _buildChipOptions(context),
  //       ConfigConstant.sizedBoxH2,
  //       // _buildPrivateVoteEvents(),
  //     ],
  //   );
  // }
  // Widget _buildBody(BuildContext context) {
  //   return ListView(
  //     padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
  //     children: [
  //       _buildChipOptions(context),
  //       ConfigConstant.sizedBoxH2,
  //       // _buildPrivateVoteEvents(),
  //     ],
  //   );
  // }
  Widget _buildBody(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      children: [
        _buildChipOptions(context),
        const SizedBox(height: 16),
        _buildEventVote(),
        const SizedBox(height: 16),
        _buildCandidateLiveVote(),
      ],
    );
  }

  Widget _buildChipOptions(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        _buildChip(context, 'All'),
        _buildChip(context, 'My Vote'),
        _buildChip(context, 'Results'),
      ],
    );
  }

  Widget _buildChip(BuildContext context, String label) {
    return Consumer<HistoryViewModel>(
      builder: (context, viewModel, child) {
        final bool isSelected = viewModel.selectedChip == label;

        return ChoiceChip(
          checkmarkColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isSelected ? M3Color.of(context).primary : const Color(0xFFDADADA),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          label: Text(label),
          selected: isSelected,
          onSelected: (bool selected) {
            if (selected) {
              viewModel.selectChip(label);
            }
          },
          backgroundColor: Colors.white,
          selectedColor: M3Color.of(context).primary,
          labelStyle: M3TextTheme.of(context).bodySmall?.copyWith(color: isSelected ? Colors.white : const Color(0xFF404040), fontWeight: FontWeight.bold),
        );
      },
    );
  }

  Widget _buildEvent({
    required BuildContext context,
    required String title,
    required String description,
    required String imageUrl,
    required String startDate,
    required String endDate,
  }) {
    return VmTapEffect(
      effects: const [
        VmTapEffectType.scaleDown,
      ],
      onTap: () {
        context.pushRoute(HistoryDetailRoute(id: 'GCBrh8zy4XRdtp0j6yFC'));
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildEventImage(context: context, imageUrl: imageUrl),
              const SizedBox(width: 16.0),
              _buildEventInformation(
                context: context,
                title: title,
                description: description,
                startDate: startDate,
                endDate: endDate,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildEventImage({
    required BuildContext context,
    required String imageUrl,
  }) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: Image.network(
        imageUrl,
        width: 90,
        height: 90,
      ),
    );
  }

  Widget _buildEventInformation({
    required BuildContext context,
    required String title,
    required String description,
    required String startDate,
    required String endDate,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: M3TextTheme.of(context).titleMedium?.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8.0),
          Text(
            description,
            style: M3TextTheme.of(context).bodySmall?.copyWith(
                  color: const Color(0xFF404040),
                ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8.0),
          RichText(
            text: TextSpan(
              text: 'Voted: ',
              style: M3TextTheme.of(context).bodySmall?.copyWith(
                    color: const Color(0xFF404040),
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Candidate A',
                  style: M3TextTheme.of(context).bodySmall?.copyWith(
                        color: const Color(0xFF404040),
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildEventVote() {
    return Text(viewModel.event?.data?.owner.toString() ?? 'No content');
  }

  _buildCandidateLiveVote() {
    return StreamBuilder(
      stream: viewModel.getStreamCandidate(),
      builder: (context, snapshop) {
        return Text(
          snapshop.data ?? 'Can not fetch candidat',
        );
      },
    );
  }
}
