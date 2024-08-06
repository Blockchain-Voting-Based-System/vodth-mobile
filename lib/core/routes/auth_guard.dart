import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/providers/user_provider.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final userProvider =
        router.navigatorKey.currentContext?.read<UserProvider>();

    if (userProvider != null && userProvider.userEmail != null) {
      resolver.next(true);
    } else {
      router.push(const LoginRoute());
    }
  }
}
