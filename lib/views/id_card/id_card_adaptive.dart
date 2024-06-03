part of 'id_card_view.dart';

class _IdCardAdaptive extends StatelessWidget {
  const _IdCardAdaptive(this.viewModel);

  final IdCardViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildContent(context),
      bottomNavigationBar: buildConfirmButton(context),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.blue),
        onPressed: () {
          // context.router.removeRoute(route);
        },
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildTitle(context),
          const SizedBox(height: 40),
          Align(
            child: Container(
              width: MediaQuery.of(context).size.width -
                  32, // Full width minus padding
              height: 300,
              decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromARGB(255, 3, 204, 174)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'VERIFICATION',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(height: 15),
        Text(
          'Place your ID card to scan',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }

  Widget buildConfirmButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 38, horizontal: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.lightBlue,
          padding: const EdgeInsets.symmetric(vertical: 20),
        ),
        onPressed: () {
          context.router.push(const FaceScanRoute());
        },
        child: Text(
          'Confirm',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
