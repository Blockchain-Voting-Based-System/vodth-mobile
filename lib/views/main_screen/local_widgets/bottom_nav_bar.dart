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
    return BottomNavigationBar(
      elevation: 0.0,
      selectedItemColor: ThemeConstant.brandColor,
      unselectedItemColor: ThemeConstant.brandColor.withOpacity(0.5),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      iconSize: ConfigConstant.iconSize3,
      currentIndex: widget.tabsRouter.activeIndex,
      onTap: (value) => widget.tabsRouter.setActiveIndex(value),
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/home_icon.png'),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/private_icon.png'),
          ),
          label: 'Prvate Vote',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/history_icon.png'),
          ),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '',
        ),
      ],
    );
  }
}
