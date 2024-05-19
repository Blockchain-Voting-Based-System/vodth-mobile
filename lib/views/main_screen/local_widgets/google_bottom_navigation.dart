import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vodth_mobile/themes/theme_constant.dart';

class GoogleBottomNavigation extends StatelessWidget {
  const GoogleBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
      backgroundColor: const Color(0xFFC2E1F3),
      color: ThemeConstant.brandColor.withOpacity(0.5),
      activeColor: ThemeConstant.brandColor,
      padding: const EdgeInsets.symmetric(
          horizontal: 20, vertical: kBottomNavigationBarHeight - 17),
      tabs: const [
        GButton(
          icon: Icons.home,
          text: 'Home',
        ),
        GButton(
          icon: Icons.groups_2_outlined,
          text: 'Candidates',
        ),
        GButton(
          icon: Icons.poll,
          text: 'Result',
        ),
        GButton(
          icon: Icons.settings,
          text: 'Setting',
        ),
      ],
    );
  }
}
