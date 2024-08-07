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
import 'package:vodth_mobile/core/models/vodth/event_model.dart' as _i19;
import 'package:vodth_mobile/views/about_us/about_us_view.dart' as _i1;
import 'package:vodth_mobile/views/account/account_view.dart' as _i2;
import 'package:vodth_mobile/views/candidate_detail/candidate_detail_view.dart'
    as _i3;
import 'package:vodth_mobile/views/casting_vote/capture_id/capture_id_view.dart'
    as _i4;
import 'package:vodth_mobile/views/casting_vote/casting_vote_view.dart' as _i5;
import 'package:vodth_mobile/views/casting_vote/casting_vote_view_model.dart'
    as _i20;
import 'package:vodth_mobile/views/casting_vote/upload_id/upload_id_view.dart'
    as _i15;
import 'package:vodth_mobile/views/event_detail/event_detail_view.dart' as _i6;
import 'package:vodth_mobile/views/faqs/faqs_view.dart' as _i7;
import 'package:vodth_mobile/views/history/history_candidate_detail/history_candidate_detail_view.dart'
    as _i8;
import 'package:vodth_mobile/views/history/history_detail/history_detail_view.dart'
    as _i9;
import 'package:vodth_mobile/views/history/history_view.dart' as _i10;
import 'package:vodth_mobile/views/home/home_view.dart' as _i11;
import 'package:vodth_mobile/views/login/login_view.dart' as _i12;
import 'package:vodth_mobile/views/main_screen/main_screen_view.dart' as _i13;
import 'package:vodth_mobile/views/register/register_view.dart' as _i14;

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
      final args = routeData.argsAs<CandidateDetailRouteArgs>(
          orElse: () =>
              CandidateDetailRouteArgs(id: pathParams.optString('id')));
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CandidateDetailView(
          key: args.key,
          id: args.id,
        ),
      );
    },
    CaptureIdRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CaptureIdView(),
      );
    },
    CastingVoteRoute.name: (routeData) {
      final args = routeData.argsAs<CastingVoteRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
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
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.EventDetailView(
          key: args.key,
          id: args.id,
        ),
      );
    },
    FaqsRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.FaqsView(),
      );
    },
    HistoryCandidateDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<HistoryCandidateDetailRouteArgs>(
          orElse: () =>
              HistoryCandidateDetailRouteArgs(id: pathParams.optString('id')));
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.HistoryCandidateDetailView(
          key: args.key,
          id: args.id,
        ),
      );
    },
    HistoryDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<HistoryDetailRouteArgs>(
          orElse: () => HistoryDetailRouteArgs(id: pathParams.optString('id')));
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.HistoryDetailView(
          key: args.key,
          id: args.id,
        ),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.HistoryView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.HomeView(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.LoginView(),
      );
    },
    MainScreenRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.MainScreenView(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.RegisterView(),
      );
    },
    UploadIdRoute.name: (routeData) {
      final args = routeData.argsAs<UploadIdRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.UploadIdView(
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
    List<_i16.PageRouteInfo>? children,
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

  static const _i16.PageInfo<CandidateDetailRouteArgs> page =
      _i16.PageInfo<CandidateDetailRouteArgs>(name);
}

class CandidateDetailRouteArgs {
  const CandidateDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i17.Key? key;

  final String? id;

  @override
  String toString() {
    return 'CandidateDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i4.CaptureIdView]
class CaptureIdRoute extends _i16.PageRouteInfo<void> {
  const CaptureIdRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CaptureIdRoute.name,
          initialChildren: children,
        );

  static const String name = 'CaptureIdRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CastingVoteView]
class CastingVoteRoute extends _i16.PageRouteInfo<CastingVoteRouteArgs> {
  CastingVoteRoute({
    _i17.Key? key,
    required List<_i18.CandidateModel> candidates,
    required _i19.EventModel event,
    List<_i16.PageRouteInfo>? children,
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

  static const _i16.PageInfo<CastingVoteRouteArgs> page =
      _i16.PageInfo<CastingVoteRouteArgs>(name);
}

class CastingVoteRouteArgs {
  const CastingVoteRouteArgs({
    this.key,
    required this.candidates,
    required this.event,
  });

  final _i17.Key? key;

  final List<_i18.CandidateModel> candidates;

  final _i19.EventModel event;

  @override
  String toString() {
    return 'CastingVoteRouteArgs{key: $key, candidates: $candidates, event: $event}';
  }
}

/// generated route for
/// [_i6.EventDetailView]
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
/// [_i8.HistoryCandidateDetailView]
class HistoryCandidateDetailRoute
    extends _i16.PageRouteInfo<HistoryCandidateDetailRouteArgs> {
  HistoryCandidateDetailRoute({
    _i17.Key? key,
    required String? id,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          HistoryCandidateDetailRoute.name,
          args: HistoryCandidateDetailRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'HistoryCandidateDetailRoute';

  static const _i16.PageInfo<HistoryCandidateDetailRouteArgs> page =
      _i16.PageInfo<HistoryCandidateDetailRouteArgs>(name);
}

class HistoryCandidateDetailRouteArgs {
  const HistoryCandidateDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i17.Key? key;

  final String? id;

  @override
  String toString() {
    return 'HistoryCandidateDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i9.HistoryDetailView]
class HistoryDetailRoute extends _i16.PageRouteInfo<HistoryDetailRouteArgs> {
  HistoryDetailRoute({
    _i17.Key? key,
    required String? id,
    List<_i16.PageRouteInfo>? children,
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

  static const _i16.PageInfo<HistoryDetailRouteArgs> page =
      _i16.PageInfo<HistoryDetailRouteArgs>(name);
}

class HistoryDetailRouteArgs {
  const HistoryDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i17.Key? key;

  final String? id;

  @override
  String toString() {
    return 'HistoryDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i10.HistoryView]
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
/// [_i11.HomeView]
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
/// [_i12.LoginView]
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
/// [_i13.MainScreenView]
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
/// [_i14.RegisterView]
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
/// [_i15.UploadIdView]
class UploadIdRoute extends _i16.PageRouteInfo<UploadIdRouteArgs> {
  UploadIdRoute({
    _i17.Key? key,
    required String cardType,
    required _i20.CastingVoteViewModel castingVoteViewModel,
    List<_i16.PageRouteInfo>? children,
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

  static const _i16.PageInfo<UploadIdRouteArgs> page =
      _i16.PageInfo<UploadIdRouteArgs>(name);
}

class UploadIdRouteArgs {
  const UploadIdRouteArgs({
    this.key,
    required this.cardType,
    required this.castingVoteViewModel,
  });

  final _i17.Key? key;

  final String cardType;

  final _i20.CastingVoteViewModel castingVoteViewModel;

  @override
  String toString() {
    return 'UploadIdRouteArgs{key: $key, cardType: $cardType, castingVoteViewModel: $castingVoteViewModel}';
  }
}
