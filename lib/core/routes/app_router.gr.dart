// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart' as _i17;
import 'package:vodth_mobile/views/account/account_view.dart' as _i1;
import 'package:vodth_mobile/views/candidates/candidate/candidate_view.dart'
    as _i2;
import 'package:vodth_mobile/views/candidates/candidates_view.dart' as _i3;
import 'package:vodth_mobile/views/events/events_view.dart' as _i4;
import 'package:vodth_mobile/views/face_scan/face_scan_view.dart' as _i5;
import 'package:vodth_mobile/views/home/home_view.dart' as _i6;
import 'package:vodth_mobile/views/id_card/id_card_view.dart' as _i7;
import 'package:vodth_mobile/views/main_screen/main_screen_view.dart' as _i8;
import 'package:vodth_mobile/views/private/private_view.dart' as _i9;
import 'package:vodth_mobile/views/setting/setting_view.dart' as _i10;
import 'package:vodth_mobile/views/test/test_view.dart' as _i11;
import 'package:vodth_mobile/views/vote_option/vote_option_view.dart' as _i12;
import 'package:vodth_mobile/views/vote_result/vote_result_view.dart' as _i13;
import 'package:vodth_mobile/views/welcome/welcome_view.dart' as _i14;

abstract class $AppRouter extends _i15.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountView(),
      );
    },
    CandidateRoute.name: (routeData) {
      final args = routeData.argsAs<CandidateRouteArgs>(
          orElse: () => const CandidateRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CandidateView(
          key: args.key,
          candidate: args.candidate,
        ),
      );
    },
    CandidatesRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CandidatesView(),
      );
    },
    EventsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.EventsView(),
      );
    },
    FaceScanRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.FaceScanView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeView(),
      );
    },
    IdCardRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.IdCardView(),
      );
    },
    MainScreenRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.MainScreenView(),
      );
    },
    PrivateRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.PrivateView(),
      );
    },
    SettingRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SettingView(),
      );
    },
    TestRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.TestView(),
      );
    },
    VoteOptionRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.VoteOptionView(),
      );
    },
    VoteResultRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.VoteResultView(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.WelcomeView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountView]
class AccountRoute extends _i15.PageRouteInfo<void> {
  const AccountRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CandidateView]
class CandidateRoute extends _i15.PageRouteInfo<CandidateRouteArgs> {
  CandidateRoute({
    _i16.Key? key,
    _i17.CandidateModel? candidate,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          CandidateRoute.name,
          args: CandidateRouteArgs(
            key: key,
            candidate: candidate,
          ),
          initialChildren: children,
        );

  static const String name = 'CandidateRoute';

  static const _i15.PageInfo<CandidateRouteArgs> page =
      _i15.PageInfo<CandidateRouteArgs>(name);
}

class CandidateRouteArgs {
  const CandidateRouteArgs({
    this.key,
    this.candidate,
  });

  final _i16.Key? key;

  final _i17.CandidateModel? candidate;

  @override
  String toString() {
    return 'CandidateRouteArgs{key: $key, candidate: $candidate}';
  }
}

/// generated route for
/// [_i3.CandidatesView]
class CandidatesRoute extends _i15.PageRouteInfo<void> {
  const CandidatesRoute({List<_i15.PageRouteInfo>? children})
      : super(
          CandidatesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CandidatesRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i4.EventsView]
class EventsRoute extends _i15.PageRouteInfo<void> {
  const EventsRoute({List<_i15.PageRouteInfo>? children})
      : super(
          EventsRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventsRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i5.FaceScanView]
class FaceScanRoute extends _i15.PageRouteInfo<void> {
  const FaceScanRoute({List<_i15.PageRouteInfo>? children})
      : super(
          FaceScanRoute.name,
          initialChildren: children,
        );

  static const String name = 'FaceScanRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeView]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute({List<_i15.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i7.IdCardView]
class IdCardRoute extends _i15.PageRouteInfo<void> {
  const IdCardRoute({List<_i15.PageRouteInfo>? children})
      : super(
          IdCardRoute.name,
          initialChildren: children,
        );

  static const String name = 'IdCardRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i8.MainScreenView]
class MainScreenRoute extends _i15.PageRouteInfo<void> {
  const MainScreenRoute({List<_i15.PageRouteInfo>? children})
      : super(
          MainScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainScreenRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.PrivateView]
class PrivateRoute extends _i15.PageRouteInfo<void> {
  const PrivateRoute({List<_i15.PageRouteInfo>? children})
      : super(
          PrivateRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivateRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SettingView]
class SettingRoute extends _i15.PageRouteInfo<void> {
  const SettingRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i11.TestView]
class TestRoute extends _i15.PageRouteInfo<void> {
  const TestRoute({List<_i15.PageRouteInfo>? children})
      : super(
          TestRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i12.VoteOptionView]
class VoteOptionRoute extends _i15.PageRouteInfo<void> {
  const VoteOptionRoute({List<_i15.PageRouteInfo>? children})
      : super(
          VoteOptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'VoteOptionRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i13.VoteResultView]
class VoteResultRoute extends _i15.PageRouteInfo<void> {
  const VoteResultRoute({List<_i15.PageRouteInfo>? children})
      : super(
          VoteResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'VoteResultRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i14.WelcomeView]
class WelcomeRoute extends _i15.PageRouteInfo<void> {
  const WelcomeRoute({List<_i15.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}
