part of home;

class _HomeAdaptive extends StatelessWidget {
  const _HomeAdaptive(this.viewModel);

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     await viewModel.requestFaucet();
        //   },
        //   child: const Icon(Icons.add),
        // ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Vodth',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons
                    .notifications_outlined), // Add your notification icon here
                onPressed: () {
                  // Add functionality for when the notification icon is pressed
                },
              ),
            ),
          ],
        ),
        body: Container(
          
          child: EventsList(viewModel: viewModel),
        )
        // body: EventsList(viewModel: viewModel),
        );
  }

  Widget _buildBody() {
    return EventsList(viewModel: viewModel);
  }

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
}
