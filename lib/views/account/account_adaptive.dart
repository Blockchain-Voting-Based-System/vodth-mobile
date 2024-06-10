part of 'account_view.dart';

class _AccountAdaptive extends StatelessWidget {
  const _AccountAdaptive(this.viewModel);

  final AccountViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MorphingAppBar(
        title: Text(
          'Account',
          style: M3TextTheme.of(context).titleLarge?.copyWith(
                color: M3Color.of(context).primary,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      children: [
        _buildProfile(context),
        _buildAccountInformation(context),
        _buildPreferences(context),
        _buildAboutSection(context),
        _buildLogout(context),
      ],
    );
  }

  Widget _buildProfile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: _buildProfileHeader(context),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              image: NetworkImage(
                'https://avatars.githubusercontent.com/u/109834020?v=4',
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'vaneath@gmail.com',
                style: M3TextTheme.of(context).titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Row(
                children: [
                  Text('Account Address: ',
                      style: M3TextTheme.of(context).labelMedium),
                  const VmSuiAddress(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAccountInformation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _buildSectionTitle(context, 'Account Information'),
        _buildAccountItem(context, 'Edit Profile', Icons.person, () {
          context.router.push(const EditProfileRoute());
        }),
        _buildAccountItem(context, 'Change Password', Icons.lock, () {
          // Handle Change Password tap
        }),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildPreferences(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'Preferences'),
        _buildAccountItem(context, 'Language', Icons.language, () {
          // Handle Notifications tap
        }),
        _buildAccountItem(context, 'Notifications', Icons.notifications, () {
          // Handle Notifications tap
        }),
        _buildAccountItem(context, 'Themes', Icons.palette, () {
          // Handle Themes tap
        }),
        const SizedBox(height: 16),
        _buildDivider(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'About Us'),
        _buildAccountItem(context, 'About Us', Icons.info, () {
          context.router.push(const AboutUsRoute());
        }),
        _buildAccountItem(context, 'FAQs', Icons.question_mark, () {
          context.router.push(const FaqsRoute());
        }),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildLogout(BuildContext context) {
    return ListTile(
      title: Text('Logout', style: TextStyle(color: M3Color.of(context).error)),
      leading: Icon(Icons.logout, color: M3Color.of(context).error),
      onTap: () {
        context.router.push(const LoginRoute());
      },
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildAccountItem(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon, color: M3Color.of(context).primary),
      trailing:
          Icon(Icons.arrow_forward_ios, color: M3Color.of(context).primary),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return const Divider();
  }
}
