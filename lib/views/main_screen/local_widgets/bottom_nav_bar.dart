import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
      elevation: 90.0,
      selectedItemColor: ThemeConstant.brandColor,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.tabsRouter.activeIndex,
      onTap: (value) => widget.tabsRouter.setActiveIndex(value),
      items: [
        BottomNavigationBarItem(
          icon: const ImageIcon(
            AssetImage('assets/icons/home_icon.png'),
          ),
          label: tr('button.Home'),
        ),
        // BottomNavigationBarItem(
        //   icon: ImageIcon(
        //     AssetImage('assets/icons/private_icon.png'),
        //   ),
        //   label: 'Prvate Vote',
        // ),
        BottomNavigationBarItem(
          icon: const ImageIcon(
            AssetImage('assets/icons/history_icon.png'),
          ),
          label: tr('button.History'),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: tr('title.account'),
        ),
      ],
    );
  }
}
