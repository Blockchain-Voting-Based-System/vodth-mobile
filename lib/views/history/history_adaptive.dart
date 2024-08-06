part of 'history_view.dart';

class _HistoryAdaptive extends StatelessWidget {
  const _HistoryAdaptive(this.viewModel);

  final HistoryViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

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
      body: userProvider.isLoggedIn
          ? RefreshIndicator(
              child: _buildBody(context),
              onRefresh: () => viewModel.load(context),
            )
          : _buildNoAccount(context),
    );
  }

  Widget _buildNoAccount(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'No account. You need to sign in.',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.router.push(const LoginRoute());
            },
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return FutureBuilder(
      future: viewModel.load(context),
      builder: (context, snapshot) {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          itemBuilder: (context, index) {
            if (viewModel.events == null) {
              return const Center(
                child: Text('No events found'),
              );
            } else {
              return _buildEvent(context, viewModel.events![index]);
            }
          },
          itemCount: viewModel.events!.length,
        );
      },
    );
  }

  Widget _buildEvent(
    BuildContext context,
    EventModel event,
  ) {
    return VmTapEffect(
      effects: const [
        VmTapEffectType.scaleDown,
      ],
      onTap: () {
        // context.pushRoute(const EventsRoute());
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
              _buildEventImage(
                  context: context, imageUrl: event.imageUrl ?? ''),
              const SizedBox(width: 16.0),
              _buildEventInformation(
                context: context,
                title: event.name ?? 'No name',
                description: event.description ?? 'No description',
                startDate: event.startDate ?? 'No start date',
                endDate: event.endDate ?? 'No end date',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventImage({
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
}
