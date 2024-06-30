// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;
import 'package:vodth_mobile/views/about_us/about_us_view.dart' as _i1;
import 'package:vodth_mobile/views/account/account_view.dart' as _i2;
import 'package:vodth_mobile/views/candidate_detail/candidate_detail_view.dart'
    as _i3;
import 'package:vodth_mobile/views/edit_profile/edit_profile_view.dart' as _i4;
import 'package:vodth_mobile/views/event_detail/event_detail_view.dart' as _i5;
import 'package:vodth_mobile/views/faqs/faqs_view.dart' as _i6;
import 'package:vodth_mobile/views/history/history_view.dart' as _i7;
import 'package:vodth_mobile/views/home/home_view.dart' as _i8;
import 'package:vodth_mobile/views/login/login_view.dart' as _i9;
import 'package:vodth_mobile/views/main_screen/main_screen_view.dart' as _i10;
import 'package:vodth_mobile/views/private_vote/private_vote_view.dart' as _i11;
import 'package:vodth_mobile/views/register/register_view.dart' as _i12;
import 'package:vodth_mobile/views/sui_infomation/sui_infomation_view.dart'
    as _i13;
import 'package:vodth_mobile/views/test/test_view.dart' as _i14;
import 'package:vodth_mobile/views/vote_result/vote_result_view.dart' as _i15;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    AboutUsRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutUsView(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AccountView(),
      );
    },
    CandidateDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<CandidateDetailRouteArgs>(
          orElse: () => CandidateDetailRouteArgs(
                id: pathParams.optString('id'),
                suiEventId: queryParams.optString('suiEventId'),
              ));
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CandidateDetailView(
          key: args.key,
          id: args.id,
          suiEventId: args.suiEventId,
        ),
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.EditProfileView(),
      );
    },
    EventDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EventDetailRouteArgs>(
          orElse: () => EventDetailRouteArgs(id: pathParams.optString('id')));
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.EventDetailView(
          key: args.key,
          id: args.id,
        ),
      );
    },
    FaqsRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.FaqsView(),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HistoryView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HomeView(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.LoginView(),
      );
    },
    MainScreenRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.MainScreenView(),
      );
    },
    PrivateVoteRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.PrivateVoteView(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.RegisterView(),
      );
    },
    SuiInfomationRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SuiInfomationView(),
      );
    },
    TestRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.TestView(),
      );
    },
    VoteResultRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.VoteResultView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutUsView]
class AboutUsRoute extends _i16.PageRouteInfo<void> {
  const AboutUsRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AboutUsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AccountView]
class AccountRoute extends _i16.PageRouteInfo<void> {
  const AccountRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CandidateDetailView]
class CandidateDetailRoute
    extends _i16.PageRouteInfo<CandidateDetailRouteArgs> {
  CandidateDetailRoute({
    _i17.Key? key,
    required String? id,
    required String? suiEventId,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          CandidateDetailRoute.name,
          args: CandidateDetailRouteArgs(
            key: key,
            id: id,
            suiEventId: suiEventId,
          ),
          rawPathParams: {'id': id},
          rawQueryParams: {'suiEventId': suiEventId},
          initialChildren: children,
        );

  static const String name = 'CandidateDetailRoute';

  static const _i16.PageInfo<CandidateDetailRouteArgs> page =
      _i16.PageInfo<CandidateDetailRouteArgs>(name);
}

class CandidateDetailRouteArgs {
  const CandidateDetailRouteArgs({
    this.key,
    required this.id,
    required this.suiEventId,
  });

  final _i17.Key? key;

  final String? id;

  final String? suiEventId;

  @override
  String toString() {
    return 'CandidateDetailRouteArgs{key: $key, id: $id, suiEventId: $suiEventId}';
  }
}

/// generated route for
/// [_i4.EditProfileView]
class EditProfileRoute extends _i16.PageRouteInfo<void> {
  const EditProfileRoute({List<_i16.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i5.EventDetailView]
class EventDetailRoute extends _i16.PageRouteInfo<EventDetailRouteArgs> {
  EventDetailRoute({
    _i17.Key? key,
    required String? id,
    List<_i16.PageRouteInfo>? children,
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

  static const _i16.PageInfo<EventDetailRouteArgs> page =
      _i16.PageInfo<EventDetailRouteArgs>(name);
}

class EventDetailRouteArgs {
  const EventDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i17.Key? key;

  final String? id;

  @override
  String toString() {
    return 'EventDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i6.FaqsView]
class FaqsRoute extends _i16.PageRouteInfo<void> {
  const FaqsRoute({List<_i16.PageRouteInfo>? children})
      : super(
          FaqsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FaqsRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HistoryView]
class HistoryRoute extends _i16.PageRouteInfo<void> {
  const HistoryRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HomeView]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LoginView]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i10.MainScreenView]
class MainScreenRoute extends _i16.PageRouteInfo<void> {
  const MainScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          MainScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainScreenRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i11.PrivateVoteView]
class PrivateVoteRoute extends _i16.PageRouteInfo<void> {
  const PrivateVoteRoute({List<_i16.PageRouteInfo>? children})
      : super(
          PrivateVoteRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivateVoteRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i12.RegisterView]
class RegisterRoute extends _i16.PageRouteInfo<void> {
  const RegisterRoute({List<_i16.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SuiInfomationView]
class SuiInfomationRoute extends _i16.PageRouteInfo<void> {
  const SuiInfomationRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SuiInfomationRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuiInfomationRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i14.TestView]
class TestRoute extends _i16.PageRouteInfo<void> {
  const TestRoute({List<_i16.PageRouteInfo>? children})
      : super(
          TestRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i15.VoteResultView]
class VoteResultRoute extends _i16.PageRouteInfo<void> {
  const VoteResultRoute({List<_i16.PageRouteInfo>? children})
      : super(
          VoteResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'VoteResultRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}
