part of 'login_view.dart';

class _LoginAdaptive extends StatelessWidget {
  const _LoginAdaptive(this.viewModel);

  final LoginViewModel viewModel;

  Widget _buildEmailField() {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildPasswordField() {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isPasswordVisible = false;
        return TextField(
          obscureText: !isPasswordVisible,
          decoration: InputDecoration(
            labelText: 'Password',
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                // ignore: dead_code
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(
        children: [
          const SizedBox(height: 80),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Login to ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Vodth',
                  style: TextStyle(
                    color: M3Color.of(context).primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 36),
          _buildEmailField(),
          const SizedBox(height: 16),
          _buildPasswordField(),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: M3Color.of(context).primary,
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: () {
              context.router.push(const HomeRoute());
            },
            child: const Center(
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // Handle forget password action
              },
              child: const Text('Forget password?'),
            ),
          ),
          const SizedBox(height: 36),
          const Row(
            children: [
              Expanded(child: Divider()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('or Log in with'),
              ),
              Expanded(child: Divider()),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              // Handle Google login action
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
              const Text("Not yet have account?"),
              TextButton(
                onPressed: () {
                  context.router.push(const RegisterRoute());
                },
                child: const Text('Create account'),
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
