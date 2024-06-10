// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart' as _i18;
import 'package:vodth_mobile/views/about_us/about_us_view.dart' as _i1;
import 'package:vodth_mobile/views/account/account_view.dart' as _i2;
import 'package:vodth_mobile/views/candidates/candidate/candidate_view.dart'
    as _i3;
import 'package:vodth_mobile/views/candidates/candidates_view.dart' as _i4;
import 'package:vodth_mobile/views/edit_profile/edit_profile_view.dart' as _i5;
import 'package:vodth_mobile/views/events/events_view.dart' as _i6;
import 'package:vodth_mobile/views/faqs/faqs_view.dart' as _i7;
import 'package:vodth_mobile/views/history/history_view.dart' as _i8;
import 'package:vodth_mobile/views/home/home_view.dart' as _i9;
import 'package:vodth_mobile/views/login/login_view.dart' as _i10;
import 'package:vodth_mobile/views/main_screen/main_screen_view.dart' as _i11;
import 'package:vodth_mobile/views/private_vote/private_vote_view.dart' as _i12;
import 'package:vodth_mobile/views/register/register_view.dart' as _i13;
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
    CandidateRoute.name: (routeData) {
      final args = routeData.argsAs<CandidateRouteArgs>(
          orElse: () => const CandidateRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CandidateView(
          key: args.key,
          candidate: args.candidate,
        ),
      );
    },
    CandidatesRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CandidatesView(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.EditProfileView(),
      );
    },
    EventsRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.EventsView(),
      );
    },
    FaqsRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.FaqsView(),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HistoryView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.HomeView(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.LoginView(),
      );
    },
    MainScreenRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.MainScreenView(),
      );
    },
    PrivateVoteRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.PrivateVoteView(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.RegisterView(),
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
/// [_i3.CandidateView]
class CandidateRoute extends _i16.PageRouteInfo<CandidateRouteArgs> {
  CandidateRoute({
    _i17.Key? key,
    _i18.CandidateModel? candidate,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          CandidateRoute.name,
          args: CandidateRouteArgs(
            key: key,
            candidate: candidate,
          ),
          initialChildren: children,
        );

  static const String name = 'CandidateRoute';

  static const _i16.PageInfo<CandidateRouteArgs> page =
      _i16.PageInfo<CandidateRouteArgs>(name);
}

class CandidateRouteArgs {
  const CandidateRouteArgs({
    this.key,
    this.candidate,
  });

  final _i17.Key? key;

  final _i18.CandidateModel? candidate;

  @override
  String toString() {
    return 'CandidateRouteArgs{key: $key, candidate: $candidate}';
  }
}

/// generated route for
/// [_i4.CandidatesView]
class CandidatesRoute extends _i16.PageRouteInfo<void> {
  const CandidatesRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CandidatesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CandidatesRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i5.EditProfileView]
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
/// [_i6.EventsView]
class EventsRoute extends _i16.PageRouteInfo<void> {
  const EventsRoute({List<_i16.PageRouteInfo>? children})
      : super(
          EventsRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventsRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i7.FaqsView]
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
/// [_i8.HistoryView]
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
/// [_i9.HomeView]
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
/// [_i10.LoginView]
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
/// [_i11.MainScreenView]
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
/// [_i12.PrivateVoteView]
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
/// [_i13.RegisterView]
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
