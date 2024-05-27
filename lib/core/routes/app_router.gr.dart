// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:vodth_mobile/views/candidates/candidates_view.dart' as _i1;
import 'package:vodth_mobile/views/events/events_view.dart' as _i2;
import 'package:vodth_mobile/views/home/home_view.dart' as _i3;
import 'package:vodth_mobile/views/main_screen/main_screen_view.dart' as _i4;
import 'package:vodth_mobile/views/setting/setting_view.dart' as _i5;
import 'package:vodth_mobile/views/vote_result/vote_result_view.dart' as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    CandidatesRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CandidatesView(),
      );
    },
    EventsRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.EventsView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeView(),
      );
    },
    MainScreenRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainScreenView(),
      );
    },
    SettingRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SettingView(),
      );
    },
    VoteResultRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.VoteResultView(),
      );
    },
  };
}

/// generated route for
/// [_i1.CandidatesView]
class CandidatesRoute extends _i7.PageRouteInfo<void> {
  const CandidatesRoute({List<_i7.PageRouteInfo>? children})
      : super(
          CandidatesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CandidatesRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EventsView]
class EventsRoute extends _i7.PageRouteInfo<void> {
  const EventsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          EventsRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventsRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeView]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MainScreenView]
class MainScreenRoute extends _i7.PageRouteInfo<void> {
  const MainScreenRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MainScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainScreenRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SettingView]
class SettingRoute extends _i7.PageRouteInfo<void> {
  const SettingRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.VoteResultView]
class VoteResultRoute extends _i7.PageRouteInfo<void> {
  const VoteResultRoute({List<_i7.PageRouteInfo>? children})
      : super(
          VoteResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'VoteResultRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
