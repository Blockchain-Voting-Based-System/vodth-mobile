part of 'register_view.dart';

class _RegisterAdaptive extends StatelessWidget {
  const _RegisterAdaptive(this.viewModel);

  final RegisterViewModel viewModel;

  Widget _buildEmailField() {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(
        children: [
          const SizedBox(height: 80),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Create a new account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 36),
          _buildEmailField(),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: () {
              // Handle register action
            },
            child: const Center(
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 36),
          const Row(
            children: [
              Expanded(child: Divider()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('or Register with'),
              ),
              Expanded(child: Divider()),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              // Handle Google register action
            },
            icon: Image.network(
              'https://img.icons8.com/color/48/000000/google-logo.png',
              height: 24,
              width: 24,
            ),
            label: const Text('Google'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              // primary: Colors.white,
              // onPrimary: Colors.black,
              side: const BorderSide(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already has an account?"),
              TextButton(
                onPressed: () {
                  context.router.push(const LoginRoute());
                },
                child: const Text('Log in'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }
}
