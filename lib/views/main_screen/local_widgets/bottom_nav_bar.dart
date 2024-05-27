import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/constant/config_constant.dart';
import 'package:vodth_mobile/themes/theme_constant.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, required this.tabsRouter});

  final TabsRouter tabsRouter;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BottomNavigationBar(
          selectedItemColor: ThemeConstant.brandColor,
          unselectedItemColor: ThemeConstant.brandColor.withOpacity(0.5),
          backgroundColor: const Color(0xFFC2E1F3),
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          iconSize: ConfigConstant.iconSize3,
          currentIndex: widget.tabsRouter.activeIndex,
          onTap: (value) => widget.tabsRouter.setActiveIndex(value),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.groups_2_outlined),
              label: 'Candidates',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.poll),
              label: 'Result',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
}
