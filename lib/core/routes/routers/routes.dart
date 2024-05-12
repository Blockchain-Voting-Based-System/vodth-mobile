library routes;

import 'package:auto_route/auto_route.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';

final routers = [
  AutoRoute(page: HomeRoute.page, initial: true),

  //Add new route here
  AutoRoute(page: EventRoute.page),
];
