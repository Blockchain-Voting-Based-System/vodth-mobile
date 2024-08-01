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
          'About Us', // Replace with static text
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
        children: const [
          // const SizedBox(height: 16),
          Text(
            'About us', // Static text
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'We are a group of third-year students from Cambodia Academy of Digital Technology (CADT) in Cambodia. Our journey in academia has been driven by a passion for innovation and a desire to make a tangible impact in the field of technology.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 24),
          Text(
            'Our Mission',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'This project represents the culmination of our capstone experience in our third year. Our goal is to create a cutting-edge voting platform that leverages blockchain technology to ensure transparency and security. Additionally, we are integrating machine learning for optical character recognition (OCR), applying the knowledge and skills we’ve acquired throughout our studies to develop a robust and efficient system. Through this project, we aim to push the boundaries of what technology can achieve in the realm of voting and data integrity.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
