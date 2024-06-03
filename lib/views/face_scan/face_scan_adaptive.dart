part of 'face_scan_view.dart';

class _FaceScanAdaptive extends StatelessWidget {
  const _FaceScanAdaptive(this.viewModel);

  final FaceScanViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildContent(context),
      bottomNavigationBar: buildBottomNavigation(context),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.blue),
        onPressed: () {
          context.router.push(
            const VoteOptionRoute(),
          );
        },
      ),
      title: const Text(''),
    );
  }

  Widget buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildTitle(context),
          const SizedBox(height: 40),
          buildScanBox(context),
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    return Column(
      children: [
        Text('VERIFICATION', style: Theme.of(context).textTheme.displayLarge),
        const SizedBox(height: 16),
        Text('Scan your face to verify',
            style: Theme.of(context).textTheme.displaySmall),
      ],
    );
  }

  Widget buildScanBox(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        height: 300,
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 3, 204, 174)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget buildBottomNavigation(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      onPressed: () {
        _showCustomDialog(context, success: false);
      },
      child: Text(
        'Confirm',
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }

  void _showCustomDialog(BuildContext context, {required bool success}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: buildDialogContent(context, success),
        );
      },
    );
  }

  Widget buildDialogContent(BuildContext context, bool success) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Dialog(),
    );
  }
}
