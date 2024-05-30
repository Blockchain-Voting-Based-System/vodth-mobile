library routes;

import 'package:auto_route/auto_route.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';

final routers = [
  AutoRoute(page: MainScreenRoute.page, initial: true, children: [
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: CandidatesRoute.page),
    AutoRoute(page: VoteResultRoute.page),
    AutoRoute(page: AccountRoute.page),
  ]),

  //Add new route here
  AutoRoute(page: CandidateRoute.page),
  AutoRoute(page: AccountRoute.page, path: '/account'),
];
