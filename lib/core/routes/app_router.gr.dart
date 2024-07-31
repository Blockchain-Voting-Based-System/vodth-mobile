// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;
import 'package:vodth_mobile/views/account/account_view.dart' as _i1;
import 'package:vodth_mobile/views/candidate_detail/candidate_detail_view.dart'
    as _i2;
import 'package:vodth_mobile/views/capture_id/capture_id_view.dart' as _i3;
import 'package:vodth_mobile/views/casting_vote/casting_vote_view.dart' as _i4;
import 'package:vodth_mobile/views/event_detail/event_detail_view.dart' as _i5;
import 'package:vodth_mobile/views/faqs/faqs_view.dart' as _i6;
import 'package:vodth_mobile/views/history/history_view.dart' as _i8;
import 'package:vodth_mobile/views/history_detail/history_detail_view.dart'
    as _i7;
import 'package:vodth_mobile/views/home/home_view.dart' as _i9;
import 'package:vodth_mobile/views/id_card/national_id_card_ocr/national_id_card_ocr_view.dart'
    as _i14;
import 'package:vodth_mobile/views/id_card_ocr/id_card_ocr_view.dart' as _i10;
import 'package:vodth_mobile/views/id_card_options/id_card_options_view.dart'
    as _i11;
import 'package:vodth_mobile/views/login/login_view.dart' as _i12;
import 'package:vodth_mobile/views/main_screen/main_screen_view.dart' as _i13;
import 'package:vodth_mobile/views/register/register_view.dart' as _i15;
import 'package:vodth_mobile/views/upload_id/upload_id_view.dart' as _i16;

abstract class $AppRouter extends _i17.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountView(),
      );
    },
    CandidateDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CandidateDetailRouteArgs>(
          orElse: () =>
              CandidateDetailRouteArgs(id: pathParams.optString('id')));
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CandidateDetailView(
          key: args.key,
          id: args.id,
        ),
      );
    },
    CaptureIdRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CaptureIdView(),
      );
    },
    CastingVoteRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CastingVoteView(),
      );
    },
    EventDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EventDetailRouteArgs>(
          orElse: () => EventDetailRouteArgs(id: pathParams.optString('id')));
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.EventDetailView(
          key: args.key,
          id: args.id,
        ),
      );
    },
    FaqsRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.FaqsView(),
      );
    },
    HistoryDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<HistoryDetailRouteArgs>(
          orElse: () => HistoryDetailRouteArgs(id: pathParams.optString('id')));
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.HistoryDetailView(
          key: args.key,
          id: args.id,
        ),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HistoryView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.HomeView(),
      );
    },
    IdCardOcrRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.IdCardOcrView(),
      );
    },
    IdCardOptionsRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.IdCardOptionsView(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.LoginView(),
      );
    },
    MainScreenRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.MainScreenView(),
      );
    },
    NationalIdCardOcrRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.NationalIdCardOcrView(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.RegisterView(),
      );
    },
    UploadIdRoute.name: (routeData) {
      final args = routeData.argsAs<UploadIdRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.UploadIdView(
          key: args.key,
          cardType: args.cardType,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountView]
class AccountRoute extends _i17.PageRouteInfo<void> {
  const AccountRoute({List<_i17.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CandidateDetailView]
class CandidateDetailRoute
    extends _i17.PageRouteInfo<CandidateDetailRouteArgs> {
  CandidateDetailRoute({
    _i18.Key? key,
    required String? id,
    List<_i17.PageRouteInfo>? children,
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

  static const _i17.PageInfo<CandidateDetailRouteArgs> page =
      _i17.PageInfo<CandidateDetailRouteArgs>(name);
}

class CandidateDetailRouteArgs {
  const CandidateDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i18.Key? key;

  final String? id;

  @override
  String toString() {
    return 'CandidateDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i3.CaptureIdView]
class CaptureIdRoute extends _i17.PageRouteInfo<void> {
  const CaptureIdRoute({List<_i17.PageRouteInfo>? children})
      : super(
          CaptureIdRoute.name,
          initialChildren: children,
        );

  static const String name = 'CaptureIdRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CastingVoteView]
class CastingVoteRoute extends _i17.PageRouteInfo<void> {
  const CastingVoteRoute({List<_i17.PageRouteInfo>? children})
      : super(
          CastingVoteRoute.name,
          initialChildren: children,
        );

  static const String name = 'CastingVoteRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i5.EventDetailView]
class EventDetailRoute extends _i17.PageRouteInfo<EventDetailRouteArgs> {
  EventDetailRoute({
    _i18.Key? key,
    required String? id,
    List<_i17.PageRouteInfo>? children,
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

  static const _i17.PageInfo<EventDetailRouteArgs> page =
      _i17.PageInfo<EventDetailRouteArgs>(name);
}

class EventDetailRouteArgs {
  const EventDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i18.Key? key;

  final String? id;

  @override
  String toString() {
    return 'EventDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i6.FaqsView]
class FaqsRoute extends _i17.PageRouteInfo<void> {
  const FaqsRoute({List<_i17.PageRouteInfo>? children})
      : super(
          FaqsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FaqsRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HistoryDetailView]
class HistoryDetailRoute extends _i17.PageRouteInfo<HistoryDetailRouteArgs> {
  HistoryDetailRoute({
    _i18.Key? key,
    required String? id,
    List<_i17.PageRouteInfo>? children,
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

  static const _i17.PageInfo<HistoryDetailRouteArgs> page =
      _i17.PageInfo<HistoryDetailRouteArgs>(name);
}

class HistoryDetailRouteArgs {
  const HistoryDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i18.Key? key;

  final String? id;

  @override
  String toString() {
    return 'HistoryDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i8.HistoryView]
class HistoryRoute extends _i17.PageRouteInfo<void> {
  const HistoryRoute({List<_i17.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i9.HomeView]
class HomeRoute extends _i17.PageRouteInfo<void> {
  const HomeRoute({List<_i17.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i10.IdCardOcrView]
class IdCardOcrRoute extends _i17.PageRouteInfo<void> {
  const IdCardOcrRoute({List<_i17.PageRouteInfo>? children})
      : super(
          IdCardOcrRoute.name,
          initialChildren: children,
        );

  static const String name = 'IdCardOcrRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i11.IdCardOptionsView]
class IdCardOptionsRoute extends _i17.PageRouteInfo<void> {
  const IdCardOptionsRoute({List<_i17.PageRouteInfo>? children})
      : super(
          IdCardOptionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'IdCardOptionsRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i12.LoginView]
class LoginRoute extends _i17.PageRouteInfo<void> {
  const LoginRoute({List<_i17.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i13.MainScreenView]
class MainScreenRoute extends _i17.PageRouteInfo<void> {
  const MainScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          MainScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainScreenRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i14.NationalIdCardOcrView]
class NationalIdCardOcrRoute extends _i17.PageRouteInfo<void> {
  const NationalIdCardOcrRoute({List<_i17.PageRouteInfo>? children})
      : super(
          NationalIdCardOcrRoute.name,
          initialChildren: children,
        );

  static const String name = 'NationalIdCardOcrRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i15.RegisterView]
class RegisterRoute extends _i17.PageRouteInfo<void> {
  const RegisterRoute({List<_i17.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i16.UploadIdView]
class UploadIdRoute extends _i17.PageRouteInfo<UploadIdRouteArgs> {
  UploadIdRoute({
    _i18.Key? key,
    required String cardType,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          UploadIdRoute.name,
          args: UploadIdRouteArgs(
            key: key,
            cardType: cardType,
          ),
          initialChildren: children,
        );

  static const String name = 'UploadIdRoute';

  static const _i17.PageInfo<UploadIdRouteArgs> page =
      _i17.PageInfo<UploadIdRouteArgs>(name);
}

class UploadIdRouteArgs {
  const UploadIdRouteArgs({
    this.key,
    required this.cardType,
  });

  final _i18.Key? key;

  final String cardType;

  @override
  String toString() {
    return 'UploadIdRouteArgs{key: $key, cardType: $cardType}';
  }
}
