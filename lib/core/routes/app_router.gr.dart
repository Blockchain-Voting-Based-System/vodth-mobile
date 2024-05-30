// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart' as _i11;
import 'package:vodth_mobile/views/account/account_view.dart' as _i1;
import 'package:vodth_mobile/views/candidates/candidate/candidate_view.dart'
    as _i2;
import 'package:vodth_mobile/views/candidates/candidates_view.dart' as _i3;
import 'package:vodth_mobile/views/events/events_view.dart' as _i4;
import 'package:vodth_mobile/views/home/home_view.dart' as _i5;
import 'package:vodth_mobile/views/main_screen/main_screen_view.dart' as _i6;
import 'package:vodth_mobile/views/setting/setting_view.dart' as _i7;
import 'package:vodth_mobile/views/vote_result/vote_result_view.dart' as _i8;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountView(),
      );
    },
    CandidateRoute.name: (routeData) {
      final args = routeData.argsAs<CandidateRouteArgs>(
          orElse: () => const CandidateRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CandidateView(
          key: args.key,
          candidate: args.candidate,
        ),
      );
    },
    CandidatesRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CandidatesView(),
      );
    },
    EventsRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.EventsView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeView(),
      );
    },
    MainScreenRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MainScreenView(),
      );
    },
    SettingRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SettingView(),
      );
    },
    VoteResultRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.VoteResultView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountView]
class AccountRoute extends _i9.PageRouteInfo<void> {
  const AccountRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CandidateView]
class CandidateRoute extends _i9.PageRouteInfo<CandidateRouteArgs> {
  CandidateRoute({
    _i10.Key? key,
    _i11.CandidateModel? candidate,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          CandidateRoute.name,
          args: CandidateRouteArgs(
            key: key,
            candidate: candidate,
          ),
          initialChildren: children,
        );

  static const String name = 'CandidateRoute';

  static const _i9.PageInfo<CandidateRouteArgs> page =
      _i9.PageInfo<CandidateRouteArgs>(name);
}

class CandidateRouteArgs {
  const CandidateRouteArgs({
    this.key,
    this.candidate,
  });

  final _i10.Key? key;

  final _i11.CandidateModel? candidate;

  @override
  String toString() {
    return 'CandidateRouteArgs{key: $key, candidate: $candidate}';
  }
}

/// generated route for
/// [_i3.CandidatesView]
class CandidatesRoute extends _i9.PageRouteInfo<void> {
  const CandidatesRoute({List<_i9.PageRouteInfo>? children})
      : super(
          CandidatesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CandidatesRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.EventsView]
class EventsRoute extends _i9.PageRouteInfo<void> {
  const EventsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          EventsRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventsRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeView]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MainScreenView]
class MainScreenRoute extends _i9.PageRouteInfo<void> {
  const MainScreenRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MainScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainScreenRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SettingView]
class SettingRoute extends _i9.PageRouteInfo<void> {
  const SettingRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.VoteResultView]
class VoteResultRoute extends _i9.PageRouteInfo<void> {
  const VoteResultRoute({List<_i9.PageRouteInfo>? children})
      : super(
          VoteResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'VoteResultRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
