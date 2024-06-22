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

  Widget _buildBody(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      children: [
        _buildChipOptions(context),
        ConfigConstant.sizedBoxH2,
        // _buildPrivateVoteEvents(),
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
              color: isSelected
                  ? M3Color.of(context).primary
                  : const Color(0xFFDADADA),
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
          labelStyle: M3TextTheme.of(context).bodySmall?.copyWith(
              color: isSelected ? Colors.white : const Color(0xFF404040),
              fontWeight: FontWeight.bold),
        );
      },
    );
  }

  // Widget _buildPrivateVoteEvents() {
  //   // return EventsList(events: viewModel.events);
  // }
}
