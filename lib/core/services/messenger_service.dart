import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vodth_mobile/constant/config_constant.dart';

class MessengerService {
  final BuildContext context;

  MessengerService._({
    required this.context,
  });

  static MessengerService of(BuildContext context) {
    return MessengerService._(context: context);
  }

  ScaffoldMessengerState? get state {
    return ScaffoldMessenger.maybeOf(context);
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? scaffoldFeatureController;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showSnackBar(
    String message, {
    Color? foregroundColor,
    Color? backgroundColor,
    SnackBarAction Function(Color? foreground)? action,
    bool showAction = true,
  }) {
    clearSnackBars();

    return state?.showSnackBar(
      SnackBar(
        width: 320.0,
        content: Text(message, style: TextStyle(color: foregroundColor)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        dismissDirection: DismissDirection.horizontal,
        action: showAction
            ? action != null
                ? action(foregroundColor)
                : SnackBarAction(
                    label: MaterialLocalizations.of(context).okButtonLabel,
                    textColor: foregroundColor,
                    onPressed: () {},
                  )
            : null,
      ),
    );
  }

  void clearSnackBars() {
    return state?.clearSnackBars();
  }

  void hideCurrentMaterialBanner() {
    return state?.hideCurrentMaterialBanner();
  }

  Future<T?> showBlankLoading<T>({
    required Future<T?> Function() future,
    required String? debugSource,
    bool rootNavigator = false,
    bool barrierDismissible = false,
  }) async {
    return showLoading(
      future: future,
      builder: (context, _) => const SizedBox.shrink(),
      debugSource: debugSource,
      rootNavigator: rootNavigator,
      barrierDismissible: barrierDismissible,
    );
  }

  Future<T?> showLoading<T>({
    required Future<T?> Function() future,
    required String? debugSource,
    String Function(T?)? debugResult,
    Widget Function(BuildContext context, Widget child)? builder,
    bool rootNavigator = false,
    bool barrierDismissible = true,
  }) async {
    if (debugSource != null) debugPrint('LOADING $debugSource');
    bool popped = false;

    final Completer<T?> completer = Completer();
    future.call()
      ..then((value) => completer.complete(value))
      ..catchError((error, stackTrace) {
        completer.completeError(error, stackTrace);
        return null;
      });

    T? result = await showAdaptiveDialog<T?>(
      context: context,
      useRootNavigator: rootNavigator,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return FutureBuilder<T?>(
          future: completer.future,
          builder: (context, snapshot) {
            if (completer.isCompleted && !popped) {
              popped = true;
              Navigator.maybePop(context, snapshot.data);
            }

            final child = AlertDialog(
              alignment: Alignment.center,
              content: Lottie.asset(
                'assets/lotties/loading.json',
                width: ConfigConstant.objectHeight6,
                height: ConfigConstant.objectHeight6,
              ),
            );

            if (builder != null) return builder(context, child);
            return child;
          },
        );
      },
    );

    if (debugResult != null) {
      debugPrint('LOADED $debugSource with result: ${debugResult(result)}');
    } else if (debugSource != null) {
      debugPrint('LOADED $debugSource with result: ${result.runtimeType}');
    }

    return result;
  }
}
