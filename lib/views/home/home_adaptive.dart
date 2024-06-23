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
        _buildEvent(
          context: context,
          title: 'CSA Voting',
          description:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry',
          startDate: '10/7/2024',
          endDate: '31/7/2024',
          imageUrl: "https://avatars.githubusercontent.com/u/109834020?v=4",
        ),
        _buildEvent(
          context: context,
          title: 'Presedential Election',
          description:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry',
          startDate: '1/2/2024',
          endDate: '31/3/2024',
          imageUrl:
              "https://media.istockphoto.com/id/1337692300/vector/orator-speaking-from-tribune.jpg?s=612x612&w=0&k=20&c=lC3TceG4QvPN6K3ci76QbV0OWJ2637WV-wbLQJDc3pg=",
        ),
        _buildEvent(
          context: context,
          title: 'Class Representative Election',
          description:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry',
          startDate: '1/8/2024',
          endDate: '7/8/2024',
          imageUrl:
              "https://www.shutterstock.com/image-illustration/political-leader-speaking-media-background-600nw-2074143290.jpg",
        ),

        // Add more events here
        for (int i = 0; i < viewModel.eventCount; i++)
          _buildEvent(
            context: context,
            title: 'Event $i',
            description:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry',
            startDate: '1st Aug 2024',
            endDate: '7th Aug 2024',
            imageUrl:
                "https://www.shutterstock.com/image-illustration/political-leader-speaking-media-background-600nw-2074143290.jpg",
          ),
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
        context.pushRoute(const EventsRoute());
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
        width: 100,
        height: 100,
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
                  color: M3Color.of(context).primary,
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
              text: 'Date: ',
              style: M3TextTheme.of(context).bodySmall?.copyWith(
                    color: const Color(0xFF404040),
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: '$startDate - $endDate',
                  style: M3TextTheme.of(context).bodySmall?.copyWith(
                        color: const Color(0xFF404040),
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
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
