part of 'edit_profile_view.dart';

class _EditProfileAdaptive extends StatelessWidget {
  const _EditProfileAdaptive(this.viewModel);

  final EditProfileViewModel viewModel;

  Widget _buildUsernameField() {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Username',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildProfilePicture() {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/109834020?v=4'), // Placeholder image
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.blue,
                  size: 30,
                ),
                onPressed: () {
                  // Handle change profile picture
                },
              ),
            ),
          ),
          SizedBox(height: 16),
          TextButton(
            onPressed: () {
              // Handle change profile picture
            },
            child: Text(
              'Outhdom',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Edit profile',
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
          icon: Icon(Icons.arrow_back, color: Colors.blue),
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
          const SizedBox(height: 24),
          _buildProfilePicture(),
          const SizedBox(height: 36),
          _buildUsernameField(),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: () {
              // Handle login action
            },
            child: const Center(
              child: Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
