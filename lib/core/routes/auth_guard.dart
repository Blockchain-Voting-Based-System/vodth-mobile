import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/providers/user_provider.dart';
import 'package:vodth_mobile/views/widgets/app_scope.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final UserProvider userProvider =
        Provider.of<UserProvider>(AppScope.globalContext!, listen: false);

    print('hellooo : ${userProvider.isLoggedIn}');
    if (userProvider.isLoggedIn) {
      resolver.next(true);
    } else {
      router.push(const LoginRoute());
    }
  }
}
