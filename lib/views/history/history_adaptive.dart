part of 'history_view.dart';

class _HistoryAdaptive extends StatelessWidget {
  const _HistoryAdaptive(this.viewModel);

  final HistoryViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: buildAppBar(context),
      body: buildBody(),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Text(
        'History',
        style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: M3Color.of(context).primary),
      ),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          buildTabs(),
          ConfigConstant.sizedBoxH2,
          buildPrivateVoteEvents(),
        ],
      ),
    );
  }

  Widget buildTabs() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            print('nothing');
          },
          child: const Text('All'),
        ),
        ConfigConstant.sizedBoxW1,
        ElevatedButton(
          onPressed: () {
            print('nothing');
          },
          child: const Text('My vote'),
        ),
        ConfigConstant.sizedBoxW1,
        ElevatedButton(
          onPressed: () {
            print('nothing');
          },
          child: const Text('Result'),
        ),
      ],
    );
  }

  Widget buildPrivateVoteEvents() {
    return Expanded(
      child: EventsList(events: viewModel.events),
    );
  }
}
