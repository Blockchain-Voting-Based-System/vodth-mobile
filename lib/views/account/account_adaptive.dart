part of account;

class _AccountAdaptive extends StatelessWidget {
  const _AccountAdaptive(this.viewModel);

  final AccountViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {}

  Widget _buildBody() {
    return ListView(
      children: [
        _buildProfile(),
        _buildMenu(),
      ],
    );
  }

  Widget _buildProfile() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: ThemeConstant.defaultFontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                ' [email protected]',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenu() {
    return Column(
      children: [
        _buildMenuItem(
          icon: Icons.person,
          title: 'Profile',
          onTap: () {},
        ),
        _buildMenuItem(
          icon: Icons.settings,
          title: 'Settings',
          onTap: () {},
        ),
        _buildMenuItem(
          icon: Icons.logout,
          title: 'Logout',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
