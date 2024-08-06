// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:vodth_mobile/core/models/user_model.dart';
// import 'package:vodth_mobile/core/providers/user_provider.dart';
// import 'package:vodth_mobile/core/routes/app_router.gr.dart';
// import 'package:vodth_mobile/core/theme/m3_color.dart';
// import 'package:vodth_mobile/core/theme/m3_text_theme.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:vodth_mobile/features/account/view_model/account_view_model.dart';
// import 'package:vodth_mobile/features/languages/bottom_sheet/vm_languages_bottom_sheet.dart';
// import 'package:vodth_mobile/features/theme/bottom_sheet/vm_theme_bottom_sheet.dart';
// import 'package:easy_localization/easy_localization.dart';

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
        _buildAuthAction(context),
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
              Consumer<UserProvider>(
                builder: (context, userProvider, child) {
                  return Text(
                    userProvider.user?.id ?? "No Account",
                    style: M3TextTheme.of(context).titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  );
                },
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
        _buildAccountItem(context, tr('title.Choose_Languages'), Icons.language, () {
          VmLanuagesBottomSheet().show(context);
        }),
        _buildAccountItem(context, tr('title.Themes'), Icons.palette, () {
          VmThemeBottomSheet().show(context);
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
          context.router.push(const AboutUsRoute());
        }),
        _buildAccountItem(context, tr('title.FAQs'), Icons.question_mark, () {
          context.router.push(const FaqsRoute());
        }),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildAuthAction(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        if (userProvider.userEmail == null) {
          return Center(
            child: TextButton(
              onPressed: () {
                context.router.push(const LoginRoute());
              },
              child: Text(
                tr('sign_in'),
                style: TextStyle(
                  fontSize: 16,
                  color: M3Color.of(context).primary,
                ),
              ),
            ),
          );
        } else {
          return ListTile(
            title: Text(
              tr('title.Logout'),
              style: TextStyle(color: M3Color.of(context).error),
            ),
            leading: Icon(Icons.logout, color: M3Color.of(context).error),
            onTap: () async {
              await viewModel.signOut(context);
            },
          );
        }
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

  Widget _buildAccountItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon, color: M3Color.of(context).primary),
      trailing: Icon(Icons.arrow_forward_ios, color: M3Color.of(context).primary),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return const Divider();
  }
}
