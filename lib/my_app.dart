import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/routes/app_router.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }

  AutoRouterDelegate routerDelegate() {
    return _appRouter.delegate(
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
