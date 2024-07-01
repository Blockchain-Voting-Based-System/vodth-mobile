part of 'about_us_view.dart';

class _AboutUsAdaptive extends StatelessWidget {
  const _AboutUsAdaptive(this.viewModel);

  final AboutUsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'About us',
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
          // const SizedBox(height: 16),
          const Text('Vodth',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
          const SizedBox(height: 16),
          Text(viewModel.aboutUs[0]['aboutus_desc'].toString(),
              style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 24),
          const Text('Our Mission',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
          const SizedBox(height: 16),
          Text(viewModel.aboutUs[0]['aboutus_ourmission'].toString(),
              style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
