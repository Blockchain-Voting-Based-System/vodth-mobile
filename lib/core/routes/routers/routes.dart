library routes;

import 'package:auto_route/auto_route.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';

final routers = [
  AutoRoute(page: MainScreenRoute.page, initial: true, children: [
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: PrivateVoteRoute.page),
    AutoRoute(page: HistoryRoute.page),
    AutoRoute(page: AccountRoute.page),
  ]),

  //Add new route here
  AutoRoute(page: CandidateDetailRoute.page, path: '/candidates/:id'),
  AutoRoute(page: AccountRoute.page, path: '/account'),
  AutoRoute(page: LoginRoute.page),
  AutoRoute(page: RegisterRoute.page),
  AutoRoute(page: EventDetailRoute.page, path: '/events/:id'),
  AutoRoute(page: AboutUsRoute.page),
  AutoRoute(page: EditProfileRoute.page),
  AutoRoute(page: FaqsRoute.page),
  AutoRoute(page: SuiInfomationRoute.page),
  AutoRoute(page: VoteResultRoute.page),
];
