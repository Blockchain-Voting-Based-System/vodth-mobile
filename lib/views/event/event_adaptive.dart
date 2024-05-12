part of event;

class _EventAdaptive extends StatelessWidget {
  const _EventAdaptive(this.viewModel);

  final EventViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: () {
            context.router.pop();
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: const Center(
        child: Text('data'),
      ),
    );
  }
}
