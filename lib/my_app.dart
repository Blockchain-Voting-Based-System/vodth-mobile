import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vodth_mobile/core/routes/app_router.dart';
import 'package:vodth_mobile/providers/theme_provider.dart';

class MyApp extends StatelessWidget {
  final AppRouter router;

  const MyApp({
    super.key,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      themeMode: themeProvider.themeMode,
      theme: themeProvider.lightTheme,
      darkTheme: themeProvider.darkTheme,
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
      placeholder: (context) => const Center(child: CircularProgressIndicator.adaptive()),
      deepLinkBuilder: null,
    );
  }
}
