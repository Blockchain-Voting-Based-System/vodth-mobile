part of 'home_view.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            padding: const EdgeInsets.only(right: 16),
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
      // body: Container(

      //   child: EventsList(viewModel: viewModel),
      // )
      body: _buildBody(context),
    );
  }

  Widget _buildBody(context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome, vaneath!',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: M3Color.of(context).primary),
          ),
          const SizedBox(height: 16),
          const Text(
            'Events',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: EventsList(events: viewModel.events),
          ),
        ],
      ),
    );
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
