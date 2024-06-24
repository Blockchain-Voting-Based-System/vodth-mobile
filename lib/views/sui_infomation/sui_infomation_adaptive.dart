part of 'sui_infomation_view.dart';

class _SuiInfomationAdaptive extends StatelessWidget {
  const _SuiInfomationAdaptive(this.viewModel);

  final SuiInfomationViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'SUI Wallet',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(
        children: [
          _buildOwnedObjects(),
          // const SizedBox(height: 16),
          // Text('Vodth',
          //     style: TextStyle(
          //         fontSize: 24,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.grey)),
          // SizedBox(height: 16),
          // Text(
          //     'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it',
          //     style: TextStyle(fontSize: 16)),
          // SizedBox(height: 24),
          // Text('Our Mission',
          //     style: TextStyle(
          //         fontSize: 24,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.grey)),
          // SizedBox(height: 16),
          // Text(
          //     'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it',
          //     style: TextStyle(fontSize: 16)),
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
