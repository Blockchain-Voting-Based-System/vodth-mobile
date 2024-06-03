part of 'home_view.dart';

class _HomeAdaptive extends StatelessWidget {
  const _HomeAdaptive(this.viewModel);

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await viewModel.requestFaucet();
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Election',
          style: TextStyle(
            color: Colors.black,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SizedBox(
        child: ListView(
      children: [
        Text(
          'Current Balance: ${viewModel.balance}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        if (viewModel.ownedObject != null) _buildOwnedObjects(),
      ],
    ));
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
