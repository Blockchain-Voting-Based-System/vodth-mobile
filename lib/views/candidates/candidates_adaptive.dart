part of 'candidates_view.dart';

class _CandidatesAdaptive extends StatelessWidget {
  const _CandidatesAdaptive(this.viewModel);

  final CandidatesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Text(
        'Private Vote',
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
          onPressed: () {},
          child: const Text('All'),
        ),
        ConfigConstant.sizedBoxW1,
        ElevatedButton(
          onPressed: () {},
          child: const Text('My vote'),
        ),
        ConfigConstant.sizedBoxW1,
        ElevatedButton(
          onPressed: () {},
          child: const Text('Result'),
        ),
      ],
    );
  }

  Widget buildPrivateVoteEvents() {
    return Expanded(child: EventsList(events: viewModel.events));
  }
}
