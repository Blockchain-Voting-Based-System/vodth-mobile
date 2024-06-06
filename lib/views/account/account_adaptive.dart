part of 'account_view.dart';

class _AccountAdaptive extends StatelessWidget {
  const _AccountAdaptive(this.viewModel);

  final AccountViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(
        children: [
          _buildProfile(context),
          const SizedBox(height: 36),
          const Text('Account Information',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
          const SizedBox(height: 16),
          _buildAccountItem(context, 'Edit Profile', Icons.person, () {
            context.router.push(const EditProfileRoute());
          }),
          _buildAccountItem(context, 'Change Password', Icons.lock, () {
            // Handle Change Password tap
          }),
          const SizedBox(height: 24),
          const Text('Preferences',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
          const SizedBox(height: 16),
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
          const Divider(),
          const SizedBox(height: 16),
          _buildAccountItem(context, 'About Us', Icons.info, () {
            context.router.push(const AboutUsRoute());
          }),
          _buildAccountItem(context, 'FAQs', Icons.question_mark, () {
            context.router.push(const FaqsRoute());
          }),
          ListTile(
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            leading: const Icon(Icons.logout, color: Colors.red),
            onTap: () {
              context.router.push(const LoginRoute());
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfile(BuildContext context) {
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
        Column(
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
      ],
      // ),
    );
  }

  Widget _buildAccountItem(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon, color: Colors.blue),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blue),
      onTap: onTap,
    );
  }
}
