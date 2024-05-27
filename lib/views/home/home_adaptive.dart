part of home;

class _HomeAdaptive extends StatelessWidget {
  const _HomeAdaptive(this.viewModel);

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Election',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: EventsList(viewModel: viewModel),
    );
  }
}
