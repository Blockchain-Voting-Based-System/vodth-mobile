import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/routes/app_router.dart';
import 'package:vodth_mobile/core/theme/theme_config.dart';

class MyApp extends StatelessWidget {
  final AppRouter router;

  const MyApp({
    super.key,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.light,
      theme: ThemeConfig.light().themeData,
      debugShowCheckedModeBanner: false,
      routerConfig: router.config(),
    );
  }

  AutoRouterDelegate routerDelegate() {
    return router.delegate(
      navigatorObservers: () => [
        ...AutoRouterDelegate.defaultNavigatorObserversBuilder(),
        AutoRouteObserver(),
      ],
      placeholder: (context) =>
          const Center(child: CircularProgressIndicator.adaptive()),
      deepLinkBuilder: null,
    );
  }
}
