// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:vodth_mobile/views/account/account_view.dart' as _i1;
import 'package:vodth_mobile/views/candidate_detail/candidate_detail_view.dart'
    as _i2;
import 'package:vodth_mobile/views/casting_vote/casting_vote_view.dart' as _i3;
import 'package:vodth_mobile/views/event_detail/event_detail_view.dart' as _i4;
import 'package:vodth_mobile/views/faqs/faqs_view.dart' as _i5;
import 'package:vodth_mobile/views/history/history_view.dart' as _i7;
import 'package:vodth_mobile/views/history_detail/history_detail_view.dart'
    as _i6;
import 'package:vodth_mobile/views/home/home_view.dart' as _i8;
import 'package:vodth_mobile/views/login/login_view.dart' as _i9;
import 'package:vodth_mobile/views/main_screen/main_screen_view.dart' as _i10;
import 'package:vodth_mobile/views/register/register_view.dart' as _i11;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountView(),
      );
    },
    CandidateDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CandidateDetailRouteArgs>(
          orElse: () =>
              CandidateDetailRouteArgs(id: pathParams.optString('id')));
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CandidateDetailView(
          key: args.key,
          id: args.id,
        ),
      );
    },
    CastingVoteRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CastingVoteView(),
      );
    },
    EventDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EventDetailRouteArgs>(
          orElse: () => EventDetailRouteArgs(id: pathParams.optString('id')));
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.EventDetailView(
          key: args.key,
          id: args.id,
        ),
      );
    },
    FaqsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.FaqsView(),
      );
    },
    HistoryDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<HistoryDetailRouteArgs>(
          orElse: () => HistoryDetailRouteArgs(id: pathParams.optString('id')));
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.HistoryDetailView(
          key: args.key,
          id: args.id,
        ),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HistoryView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HomeView(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.LoginView(),
      );
    },
    MainScreenRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.MainScreenView(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.RegisterView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountView]
class AccountRoute extends _i12.PageRouteInfo<void> {
  const AccountRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CandidateDetailView]
class CandidateDetailRoute
    extends _i12.PageRouteInfo<CandidateDetailRouteArgs> {
  CandidateDetailRoute({
    _i13.Key? key,
    required String? id,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          CandidateDetailRoute.name,
          args: CandidateDetailRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'CandidateDetailRoute';

  static const _i12.PageInfo<CandidateDetailRouteArgs> page =
      _i12.PageInfo<CandidateDetailRouteArgs>(name);
}

class CandidateDetailRouteArgs {
  const CandidateDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i13.Key? key;

  final String? id;

  @override
  String toString() {
    return 'CandidateDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i3.CastingVoteView]
class CastingVoteRoute extends _i12.PageRouteInfo<void> {
  const CastingVoteRoute({List<_i12.PageRouteInfo>? children})
      : super(
          CastingVoteRoute.name,
          initialChildren: children,
        );

  static const String name = 'CastingVoteRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.EventDetailView]
class EventDetailRoute extends _i12.PageRouteInfo<EventDetailRouteArgs> {
  EventDetailRoute({
    _i13.Key? key,
    required String? id,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          EventDetailRoute.name,
          args: EventDetailRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'EventDetailRoute';

  static const _i12.PageInfo<EventDetailRouteArgs> page =
      _i12.PageInfo<EventDetailRouteArgs>(name);
}

class EventDetailRouteArgs {
  const EventDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i13.Key? key;

  final String? id;

  @override
  String toString() {
    return 'EventDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i5.FaqsView]
class FaqsRoute extends _i12.PageRouteInfo<void> {
  const FaqsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          FaqsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FaqsRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HistoryDetailView]
class HistoryDetailRoute extends _i12.PageRouteInfo<HistoryDetailRouteArgs> {
  HistoryDetailRoute({
    _i13.Key? key,
    required String? id,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          HistoryDetailRoute.name,
          args: HistoryDetailRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'HistoryDetailRoute';

  static const _i12.PageInfo<HistoryDetailRouteArgs> page =
      _i12.PageInfo<HistoryDetailRouteArgs>(name);
}

class HistoryDetailRouteArgs {
  const HistoryDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i13.Key? key;

  final String? id;

  @override
  String toString() {
    return 'HistoryDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i7.HistoryView]
class HistoryRoute extends _i12.PageRouteInfo<void> {
  const HistoryRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HomeView]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LoginView]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute({List<_i12.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.MainScreenView]
class MainScreenRoute extends _i12.PageRouteInfo<void> {
  const MainScreenRoute({List<_i12.PageRouteInfo>? children})
      : super(
          MainScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainScreenRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.RegisterView]
class RegisterRoute extends _i12.PageRouteInfo<void> {
  const RegisterRoute({List<_i12.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
