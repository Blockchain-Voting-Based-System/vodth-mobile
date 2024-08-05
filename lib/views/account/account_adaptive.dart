part of 'account_view.dart';

class _AccountAdaptive extends StatelessWidget {
  const _AccountAdaptive(this.viewModel);

  final AccountViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MorphingAppBar(
        title: Text(
          tr('title.account'),
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
        _buildDivider(),
        const SizedBox(height: 16),
        _buildPreferences(context),
        const SizedBox(height: 16),
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage('assets/images/profile.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                viewModel.userEmail ?? 'No email',
                style: M3TextTheme.of(context).titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPreferences(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, tr('title.Preferences')),
        _buildAccountItem(context, tr('title.Choose_Languages'), Icons.language,
            () {
          VmLanuagesBottomSheet().show(context);
        }),
        // _buildAccountItem(
        //     context, tr('title.Notifications'), Icons.notifications, () {}),
        _buildAccountItem(context, tr('title.Themes'), Icons.palette, () {
          // Handle Themes tap
        }),
      ],
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, tr('title.aboutus')),
        _buildAccountItem(context, tr('title.aboutus'), Icons.info, () {
          // context.router.push(const AboutUsRoute());
        }),
        _buildAccountItem(context, tr('title.FAQs'), Icons.question_mark, () {
          context.router.push(const FaqsRoute());
        }),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildLogout(BuildContext context) {
    return ListTile(
      title: Text(tr('title.Logout'),
          style: TextStyle(color: M3Color.of(context).error)),
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
