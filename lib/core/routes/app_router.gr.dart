// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart' as _i21;
import 'package:vodth_mobile/views/about_us/about_us_view.dart' as _i1;
import 'package:vodth_mobile/views/account/account_view.dart' as _i2;
import 'package:vodth_mobile/views/candidate_page/candidate_page_view.dart'
    as _i3;
import 'package:vodth_mobile/views/candidates/candidate/candidate_view.dart'
    as _i4;
import 'package:vodth_mobile/views/candidates/candidates_view.dart' as _i5;
import 'package:vodth_mobile/views/edit_profile/edit_profile_view.dart' as _i6;
import 'package:vodth_mobile/views/events/event_detail/event_detail_view.dart'
    as _i7;
import 'package:vodth_mobile/views/events/events_view.dart' as _i8;
import 'package:vodth_mobile/views/faqs/faqs_view.dart' as _i9;
import 'package:vodth_mobile/views/history/history_view.dart' as _i10;
import 'package:vodth_mobile/views/home/home_view.dart' as _i11;
import 'package:vodth_mobile/views/login/login_view.dart' as _i12;
import 'package:vodth_mobile/views/main_screen/main_screen_view.dart' as _i13;
import 'package:vodth_mobile/views/private_vote/private_vote_view.dart' as _i14;
import 'package:vodth_mobile/views/register/register_view.dart' as _i15;
import 'package:vodth_mobile/views/sui_infomation/sui_infomation_view.dart'
    as _i16;
import 'package:vodth_mobile/views/test/test_view.dart' as _i17;
import 'package:vodth_mobile/views/vote_result/vote_result_view.dart' as _i18;

abstract class $AppRouter extends _i19.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    AboutUsRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutUsView(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AccountView(),
      );
    },
    CandidatePageRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CandidatePageView(),
      );
    },
    CandidateRoute.name: (routeData) {
      final args = routeData.argsAs<CandidateRouteArgs>(
          orElse: () => const CandidateRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CandidateView(
          key: args.key,
          candidate: args.candidate,
        ),
      );
    },
    CandidatesRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.CandidatesView(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.EditProfileView(),
      );
    },
    EventDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EventDetailRouteArgs>(
          orElse: () => EventDetailRouteArgs(id: pathParams.optString('id')));
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.EventDetailView(
          key: args.key,
          id: args.id,
        ),
      );
    },
    EventsRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.EventsView(),
      );
    },
    FaqsRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.FaqsView(),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.HistoryView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.HomeView(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.LoginView(),
      );
    },
    MainScreenRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.MainScreenView(),
      );
    },
    PrivateVoteRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.PrivateVoteView(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.RegisterView(),
      );
    },
    SuiInfomationRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.SuiInfomationView(),
      );
    },
    TestRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.TestView(),
      );
    },
    VoteResultRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.VoteResultView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutUsView]
class AboutUsRoute extends _i19.PageRouteInfo<void> {
  const AboutUsRoute({List<_i19.PageRouteInfo>? children})
      : super(
          AboutUsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AccountView]
class AccountRoute extends _i19.PageRouteInfo<void> {
  const AccountRoute({List<_i19.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CandidatePageView]
class CandidatePageRoute extends _i19.PageRouteInfo<void> {
  const CandidatePageRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CandidatePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CandidatePageRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CandidateView]
class CandidateRoute extends _i19.PageRouteInfo<CandidateRouteArgs> {
  CandidateRoute({
    _i20.Key? key,
    _i21.CandidateModel? candidate,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          CandidateRoute.name,
          args: CandidateRouteArgs(
            key: key,
            candidate: candidate,
          ),
          initialChildren: children,
        );

  static const String name = 'CandidateRoute';

  static const _i19.PageInfo<CandidateRouteArgs> page =
      _i19.PageInfo<CandidateRouteArgs>(name);
}

class CandidateRouteArgs {
  const CandidateRouteArgs({
    this.key,
    this.candidate,
  });

  final _i20.Key? key;

  final _i21.CandidateModel? candidate;

  @override
  String toString() {
    return 'CandidateRouteArgs{key: $key, candidate: $candidate}';
  }
}

/// generated route for
/// [_i5.CandidatesView]
class CandidatesRoute extends _i19.PageRouteInfo<void> {
  const CandidatesRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CandidatesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CandidatesRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i6.EditProfileView]
class EditProfileRoute extends _i19.PageRouteInfo<void> {
  const EditProfileRoute({List<_i19.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i7.EventDetailView]
class EventDetailRoute extends _i19.PageRouteInfo<EventDetailRouteArgs> {
  EventDetailRoute({
    _i20.Key? key,
    required String? id,
    List<_i19.PageRouteInfo>? children,
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

  static const _i19.PageInfo<EventDetailRouteArgs> page =
      _i19.PageInfo<EventDetailRouteArgs>(name);
}

class EventDetailRouteArgs {
  const EventDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i20.Key? key;

  final String? id;

  @override
  String toString() {
    return 'EventDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i8.EventsView]
class EventsRoute extends _i19.PageRouteInfo<void> {
  const EventsRoute({List<_i19.PageRouteInfo>? children})
      : super(
          EventsRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventsRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i9.FaqsView]
class FaqsRoute extends _i19.PageRouteInfo<void> {
  const FaqsRoute({List<_i19.PageRouteInfo>? children})
      : super(
          FaqsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FaqsRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i10.HistoryView]
class HistoryRoute extends _i19.PageRouteInfo<void> {
  const HistoryRoute({List<_i19.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i11.HomeView]
class HomeRoute extends _i19.PageRouteInfo<void> {
  const HomeRoute({List<_i19.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i12.LoginView]
class LoginRoute extends _i19.PageRouteInfo<void> {
  const LoginRoute({List<_i19.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i13.MainScreenView]
class MainScreenRoute extends _i19.PageRouteInfo<void> {
  const MainScreenRoute({List<_i19.PageRouteInfo>? children})
      : super(
          MainScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainScreenRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i14.PrivateVoteView]
class PrivateVoteRoute extends _i19.PageRouteInfo<void> {
  const PrivateVoteRoute({List<_i19.PageRouteInfo>? children})
      : super(
          PrivateVoteRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivateVoteRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i15.RegisterView]
class RegisterRoute extends _i19.PageRouteInfo<void> {
  const RegisterRoute({List<_i19.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i16.SuiInfomationView]
class SuiInfomationRoute extends _i19.PageRouteInfo<void> {
  const SuiInfomationRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SuiInfomationRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuiInfomationRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i17.TestView]
class TestRoute extends _i19.PageRouteInfo<void> {
  const TestRoute({List<_i19.PageRouteInfo>? children})
      : super(
          TestRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i18.VoteResultView]
class VoteResultRoute extends _i19.PageRouteInfo<void> {
  const VoteResultRoute({List<_i19.PageRouteInfo>? children})
      : super(
          VoteResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'VoteResultRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}
