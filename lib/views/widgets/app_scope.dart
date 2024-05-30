import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/provider_scope.dart';

class AppScope extends StatefulWidget {
  static BuildContext? get globalContext =>
      _AppScopeState.instance._router.navigatorKey.currentContext;
  static AppRouter get router => _AppScopeState.instance._router;

  const AppScope({
    super.key,
    required this.builder,
  });

  final Widget Function(BuildContext context, AppRouter router) builder;

  static void rebirth(BuildContext context) async {
    try {
      context.router.navigateNamed('/');
    } catch (e) {
      // handle in case current page is not a router.
    }
    Future.microtask(
        () => context.findAncestorStateOfType<_AppScopeState>()!.restartApp());
  }

  @override
  State<AppScope> createState() => _AppScopeState();
}

class _AppScopeState extends State<AppScope> {
  _AppScopeState._();

  factory _AppScopeState() => _AppScopeState.instance;
  static final _AppScopeState instance = _AppScopeState._();

  late Key _key;
  late AppRouter _router;

  @override
  void initState() {
    _key = UniqueKey();
    _router = AppRouter();
    super.initState();
  }

  void restartApp() {
    setState(() {
      _key = UniqueKey();
      _router = AppRouter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: _key,
      child: ProviderScope(
        child: widget.builder(context, _router),
      ),
    );
  }
}
