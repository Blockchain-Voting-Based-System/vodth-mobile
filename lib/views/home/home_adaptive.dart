part of 'home_view.dart';

class _HomeAdaptive extends StatelessWidget {
  const _HomeAdaptive(this.viewModel);

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Image.asset(
                    'assets/images/vodth_logo.png',
                    height: 40,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => viewModel.clearLocalEventsAndFetch(),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        children: [
          _buildChipOptions(context),
          const SizedBox(height: 16),
          _buildEvents(context),
        ],
      ),
    );
  }

  Widget _buildChipOptions(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildChip(context, tr('button.All')),
          _buildChip(context, tr('button.Public')),
          _buildChip(context, tr('button.Private')),
        ],
      ),
    );
  }

  Widget _buildChip(BuildContext context, String label) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        final bool isSelected = viewModel.selectedChip == label;
        return Row(
          children: [
            ChoiceChip(
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
                  viewModel.filterEvents(label); // Add this line to filter events
                }
              },
              backgroundColor: Colors.white,
              selectedColor: M3Color.of(context).primary,
              labelStyle: M3TextTheme.of(context).bodySmall?.copyWith(
                    color: isSelected ? Colors.white : const Color(0xFF404040),
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(width: 8),
          ],
        );
      },
    );
  }

  Widget _buildEvents(BuildContext context) {
    List<EventModel>? events = viewModel.events;

    return FutureBuilder(
      future: EventService.instance.fetchEventsAndSaveToLocalStorage(),
      builder: (context, snapshot) {
        if (events.isEmpty) {
          return const Center(
            child: Text('No events found'),
          );
        }
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
                        event: event,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                );
              },
            )
          ],
        );
      },
    );
  }
}
