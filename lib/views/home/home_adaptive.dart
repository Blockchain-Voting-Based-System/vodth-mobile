part of 'home_view.dart';

class _HomeAdaptive extends StatelessWidget {
  const _HomeAdaptive(this.viewModel);

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MorphingAppBar(
        title: Image.asset(
          'assets/images/vodth_logo.png',
          height: 30,
        ),
        elevation: 0,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      children: [
        _buildChipOptions(context),
        const SizedBox(height: 16.0),
        _buildEvents(context, viewModel.eventsList ?? []),
      ],
    );
  }

  Widget _buildChipOptions(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        _buildChip(context, 'All'),
        _buildChip(context, 'Public'),
        _buildChip(context, 'Private'),
      ],
    );
  }

  Widget _buildChip(BuildContext context, String label) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        final bool isSelected = viewModel.selectedChip == label;

        return ChoiceChip(
          showCheckmark: false,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isSelected ? M3Color.of(context).primary : const Color(0xFFDADADA),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          label: Text(label),
          selected: isSelected,
          onSelected: (bool selected) {
            if (selected) {
              viewModel.selectChip(label);
            }
          },
          selectedColor: M3Color.of(context).primary,
          labelStyle: M3TextTheme.of(context).bodySmall?.copyWith(color: isSelected ? Colors.white : const Color(0xFF404040), fontWeight: FontWeight.bold),
        );
      },
    );
  }

  Widget _buildEvents(BuildContext context, List<EventModel> events) {
    return Column(
      children: [
        ...events.map(
          (event) {
            return Column(
              children: [
                VmTapEffect(
                  onTap: () {
                    context.pushRoute(EventDetailRoute(id: event.id.toString()));
                  },
                  effects: const [
                    VmTapEffectType.scaleDown,
                  ],
                  child: EventCard(
                    title: event.name ?? 'N/A',
                    time: event.startDate ?? 'N/A',
                    type: event.type ?? 'N/A',
                    thumbnailUrl: event.imageUrl ?? 'https://picsum.photos/200/300',
                    description: event.description ?? 'N/A',
                  ),
                ),
                const SizedBox(height: 8),
              ],
            );
          },
        )
      ],
    );
  }
}
