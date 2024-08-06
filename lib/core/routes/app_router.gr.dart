// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart' as _i16;
import 'package:vodth_mobile/core/models/vodth/event_model.dart' as _i17;
import 'package:vodth_mobile/views/about_us/about_us_view.dart' as _i1;
import 'package:vodth_mobile/views/account/account_view.dart' as _i2;
import 'package:vodth_mobile/views/candidate_detail/candidate_detail_view.dart'
    as _i3;
import 'package:vodth_mobile/views/casting_vote/capture_id/capture_id_view.dart'
    as _i4;
import 'package:vodth_mobile/views/casting_vote/casting_vote_view.dart' as _i5;
import 'package:vodth_mobile/views/casting_vote/casting_vote_view_model.dart'
    as _i18;
import 'package:vodth_mobile/views/casting_vote/upload_id/upload_id_view.dart'
    as _i13;
import 'package:vodth_mobile/views/event_detail/event_detail_view.dart' as _i6;
import 'package:vodth_mobile/views/faqs/faqs_view.dart' as _i7;
import 'package:vodth_mobile/views/history/history_view.dart' as _i8;
import 'package:vodth_mobile/views/home/home_view.dart' as _i9;
import 'package:vodth_mobile/views/login/login_view.dart' as _i10;
import 'package:vodth_mobile/views/main_screen/main_screen_view.dart' as _i11;
import 'package:vodth_mobile/views/register/register_view.dart' as _i12;

abstract class $AppRouter extends _i14.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    AboutUsRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutUsView(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AccountView(),
      );
    },
    CandidateDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CandidateDetailRouteArgs>(
          orElse: () =>
              CandidateDetailRouteArgs(id: pathParams.optString('id')));
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CandidateDetailView(
          key: args.key,
          id: args.id,
        ),
      );
    },
    CaptureIdRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CaptureIdView(),
      );
    },
    CastingVoteRoute.name: (routeData) {
      final args = routeData.argsAs<CastingVoteRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CastingVoteView(
          key: args.key,
          candidates: args.candidates,
          event: args.event,
        ),
      );
    },
    EventDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EventDetailRouteArgs>(
          orElse: () => EventDetailRouteArgs(id: pathParams.optString('id')));
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.EventDetailView(
          key: args.key,
          id: args.id,
        ),
      );
    },
    FaqsRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.FaqsView(),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HistoryView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.HomeView(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.LoginView(),
      );
    },
    MainScreenRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.MainScreenView(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.RegisterView(),
      );
    },
    UploadIdRoute.name: (routeData) {
      final args = routeData.argsAs<UploadIdRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.UploadIdView(
          key: args.key,
          cardType: args.cardType,
          castingVoteViewModel: args.castingVoteViewModel,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutUsView]
class AboutUsRoute extends _i14.PageRouteInfo<void> {
  const AboutUsRoute({List<_i14.PageRouteInfo>? children})
      : super(
          AboutUsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AccountView]
class AccountRoute extends _i14.PageRouteInfo<void> {
  const AccountRoute({List<_i14.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CandidateDetailView]
class CandidateDetailRoute
    extends _i14.PageRouteInfo<CandidateDetailRouteArgs> {
  CandidateDetailRoute({
    _i15.Key? key,
    required String? id,
    List<_i14.PageRouteInfo>? children,
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

  static const _i14.PageInfo<CandidateDetailRouteArgs> page =
      _i14.PageInfo<CandidateDetailRouteArgs>(name);
}

class CandidateDetailRouteArgs {
  const CandidateDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i15.Key? key;

  final String? id;

  @override
  String toString() {
    return 'CandidateDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i4.CaptureIdView]
class CaptureIdRoute extends _i14.PageRouteInfo<void> {
  const CaptureIdRoute({List<_i14.PageRouteInfo>? children})
      : super(
          CaptureIdRoute.name,
          initialChildren: children,
        );

  static const String name = 'CaptureIdRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CastingVoteView]
class CastingVoteRoute extends _i14.PageRouteInfo<CastingVoteRouteArgs> {
  CastingVoteRoute({
    _i15.Key? key,
    required List<_i16.CandidateModel> candidates,
    required _i17.EventModel event,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          CastingVoteRoute.name,
          args: CastingVoteRouteArgs(
            key: key,
            candidates: candidates,
            event: event,
          ),
          initialChildren: children,
        );

  static const String name = 'CastingVoteRoute';

  static const _i14.PageInfo<CastingVoteRouteArgs> page =
      _i14.PageInfo<CastingVoteRouteArgs>(name);
}

class CastingVoteRouteArgs {
  const CastingVoteRouteArgs({
    this.key,
    required this.candidates,
    required this.event,
  });

  final _i15.Key? key;

  final List<_i16.CandidateModel> candidates;

  final _i17.EventModel event;

  @override
  String toString() {
    return 'CastingVoteRouteArgs{key: $key, candidates: $candidates, event: $event}';
  }
}

/// generated route for
/// [_i6.EventDetailView]
class EventDetailRoute extends _i14.PageRouteInfo<EventDetailRouteArgs> {
  EventDetailRoute({
    _i15.Key? key,
    required String? id,
    List<_i14.PageRouteInfo>? children,
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

  static const _i14.PageInfo<EventDetailRouteArgs> page =
      _i14.PageInfo<EventDetailRouteArgs>(name);
}

class EventDetailRouteArgs {
  const EventDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i15.Key? key;

  final String? id;

  @override
  String toString() {
    return 'EventDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i7.FaqsView]
class FaqsRoute extends _i14.PageRouteInfo<void> {
  const FaqsRoute({List<_i14.PageRouteInfo>? children})
      : super(
          FaqsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FaqsRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HistoryView]
class HistoryRoute extends _i14.PageRouteInfo<void> {
  const HistoryRoute({List<_i14.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i9.HomeView]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute({List<_i14.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i10.LoginView]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute({List<_i14.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i11.MainScreenView]
class MainScreenRoute extends _i14.PageRouteInfo<void> {
  const MainScreenRoute({List<_i14.PageRouteInfo>? children})
      : super(
          MainScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainScreenRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i12.RegisterView]
class RegisterRoute extends _i14.PageRouteInfo<void> {
  const RegisterRoute({List<_i14.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i13.UploadIdView]
class UploadIdRoute extends _i14.PageRouteInfo<UploadIdRouteArgs> {
  UploadIdRoute({
    _i15.Key? key,
    required String cardType,
    required _i18.CastingVoteViewModel castingVoteViewModel,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          UploadIdRoute.name,
          args: UploadIdRouteArgs(
            key: key,
            cardType: cardType,
            castingVoteViewModel: castingVoteViewModel,
          ),
          initialChildren: children,
        );

  static const String name = 'UploadIdRoute';

  static const _i14.PageInfo<UploadIdRouteArgs> page =
      _i14.PageInfo<UploadIdRouteArgs>(name);
}

class UploadIdRouteArgs {
  const UploadIdRouteArgs({
    this.key,
    required this.cardType,
    required this.castingVoteViewModel,
  });

  final _i15.Key? key;

  final String cardType;

  final _i18.CastingVoteViewModel castingVoteViewModel;

  @override
  String toString() {
    return 'UploadIdRouteArgs{key: $key, cardType: $cardType, castingVoteViewModel: $castingVoteViewModel}';
  }
}
