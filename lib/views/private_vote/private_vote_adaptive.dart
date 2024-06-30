part of 'private_vote_view.dart';

class _PrivateVoteAdaptive extends StatelessWidget {
  const _PrivateVoteAdaptive(this.viewModel);

  final PrivateVoteViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MorphingAppBar(
        title: Text(
          'Private Vote',
          style: M3TextTheme.of(context).titleLarge?.copyWith(
                color: M3Color.of(context).primary,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: _buildBody(context),
      floatingActionButton: _buildAddEventButton(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      children: [
        _buildChipOptions(context),
        const SizedBox(height: 24.0),
        _buildEvent(
          context: context,
          title: 'CSA Voting',
          description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry',
          startDate: '1st July 2024',
          endDate: '31st July 2024',
          imageUrl: "https://avatars.githubusercontent.com/u/109834020?v=4",
        ),
        _buildEvent(
          context: context,
          title: 'Presedential Election',
          description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry',
          startDate: '1st Feb 2025',
          endDate: '31st March 2025',
          imageUrl: "https://media.istockphoto.com/id/1337692300/vector/orator-speaking-from-tribune.jpg?s=612x612&w=0&k=20&c=lC3TceG4QvPN6K3ci76QbV0OWJ2637WV-wbLQJDc3pg=",
        ),
        _buildEvent(
          context: context,
          title: 'Class Representative Election',
          description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry',
          startDate: '1st Aug 2024',
          endDate: '7th Aug 2024',
          imageUrl: "https://www.shutterstock.com/image-illustration/political-leader-speaking-media-background-600nw-2074143290.jpg",
        ),

        // Add more events here
        for (int i = 0; i < viewModel.eventCount; i++)
          _buildEvent(
            context: context,
            title: 'Event $i',
            description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry',
            startDate: '1st Aug 2024',
            endDate: '7th Aug 2024',
            imageUrl: "https://www.shutterstock.com/image-illustration/political-leader-speaking-media-background-600nw-2074143290.jpg",
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
        _buildChip(context, 'My Vote'),
        _buildChip(context, 'Results'),
      ],
    );
  }

  Widget _buildChip(BuildContext context, String label) {
    return Consumer<PrivateVoteViewModel>(
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
      onTap: () {},
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

  _buildAddEventButton(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      onPressed: () => _showSecretKeyDialog(context),
      backgroundColor: M3Color.of(context).primary,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  void _showSecretKeyDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Private Vote Secret Key',
            style: M3TextTheme.of(context).titleLarge?.copyWith(
                  color: M3Color.of(context).primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('Please enter your secret key to join the voting event:'),
              const SizedBox(height: 8.0),
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: "Secret Key",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDADADA)),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: M3Color.of(context).primary,
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: 100,
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: TextButton(
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  // Handle the submit action
                  // final secretKey = controller.text;

                  viewModel.setEventCount(viewModel.eventCount + 1);
                  // Perform the necessary actions with the secret key
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
