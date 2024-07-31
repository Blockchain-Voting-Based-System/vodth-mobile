part of 'event_detail_view.dart';

class _EventDetailAdaptive extends StatelessWidget {
  const _EventDetailAdaptive(this.viewModel);

  final EventDetailViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(context),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      bottom: TabBar(
        tabs: [
          Tab(text: tr('stepper.event')),
          Tab(text: tr('stepper.candidates')),
          Tab(text: tr('stepper.results')),
        ],
      ),
    );
  }

  _buildBody(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (viewModel.event == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        } else {
          return RefreshIndicator(
            onRefresh: () => viewModel.load(),
            child: TabBarView(
              children: [
                _buildEventDetail(context),
                _buildCandidates(context),
                _buildResults(context),
              ],
            ),
          );
        }
      },
      future: viewModel.load(),
    );
  }

  Widget _buildResults(BuildContext context) {
    return StreamBuilder(
      stream: viewModel.getLiveEventResult(),
      builder: (context, snapshot) {
        return EventResult(viewModel: viewModel);
      },
    );
  }

  Widget _buildEventDetail(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEventBanner(),
          _buildEventInfo(context),
        ],
      ),
    );
  }

  Image _buildEventBanner() {
    return Image.network(
      viewModel.event?.imageUrl ?? 'https://via.placeholder.com/150',
      width: double.infinity,
      height: 200,
      fit: BoxFit.cover,
    );
  }

  Padding _buildEventInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            viewModel.event?.name ?? 'N/A',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            viewModel.event?.description ?? 'N/A',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          // TextButton(
          //     onPressed: () {
          //       _showEventDetails(context);
          //     },
          //     child: Text(tr('button.More_Detail'))),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildCandidates(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      shrinkWrap: true,
      children: viewModel.candidates != null
          ? [
              Text(
                tr('stepper.candidates'),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              ...viewModel.candidates!.map(
                (candidate) {
                  return GestureDetector(
                    onTap: () {
                      context.pushRoute(
                        CandidateDetailRoute(id: candidate.id),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                            color: M3Color.of(context).primary, width: 1.0),
                      ),
                      child: ListTile(
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 32, // Image radius
                              backgroundImage: NetworkImage(
                                  candidate.imageUrl ??
                                      'https://via.placeholder.com/150'),
                            ),
                          ],
                        ),
                        title: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            candidate.name ?? 'N/A',
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  );
                },
              ),
            ]
          : [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'No candidate',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
    );
  }

  void _showEventDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Ipsum passages, and more recently with desktop publishing software.'),
                    // const CircleAvatar(
                    //   radius: 40,
                    //   backgroundImage: AssetImage('assets/images/yura.png'),
                    // ),
                    // const SizedBox(height: 16),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: M3Color.of(context).primary,
                    //       padding: const EdgeInsets.symmetric(vertical: 16.0),
                    //     ),
                    //     onPressed: () {
                    //       Navigator.pop(context);
                    //     },
                    //     child: const Text(
                    //       'Vote',
                    //       style: TextStyle(
                    //         fontSize: 16,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
