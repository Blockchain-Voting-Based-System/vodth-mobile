part of 'home_view.dart';

class _HomeAdaptive extends StatelessWidget {
  const _HomeAdaptive(this.viewModel);

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/vodth_logo.png',
          height: 40,
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: const Icon(
                Icons.notifications_outlined,
                size: 32,
              ), // Add your notification icon here
              onPressed: () {
                // Add functionality for when the notification icon is pressed
              },
            ),
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      children: [
        const SizedBox(height: 8),
        _buildSearchBar(),
        const SizedBox(height: 32),
        _buildChipOptions(context),
        const SizedBox(height: 16.0),
        EventsList(events: viewModel.eventsList ?? []),
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
              color: isSelected
                  ? M3Color.of(context).primary
                  : const Color(0xFFDADADA),
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
          backgroundColor: Colors.white,
          selectedColor: M3Color.of(context).primary,
          labelStyle: M3TextTheme.of(context).bodySmall?.copyWith(
              color: isSelected ? Colors.white : const Color(0xFF404040),
              fontWeight: FontWeight.bold),
        );
      },
    );
  }

  // ignore: unused_element
  Column _buildOwnedObjects() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Owned objects: ${viewModel.address}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        ...viewModel.ownedObject!.map(
          (object) {
            return Text(object.data?.objectId ?? '');
          },
        )
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1) // changes position of shadow
              ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search events',
          border: InputBorder.none,
          icon: Icon(Icons.search),
        ),
      ),
    );
  }
}
