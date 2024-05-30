import 'package:flutter/material.dart';
import 'package:vodth_mobile/constant/config_constant.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/views/widgets/vm_icon_button.dart';

class CmPopButton extends StatelessWidget {
  const CmPopButton({
    super.key,
    this.color,
    this.backgroundColor,
    this.onPressed,
    this.forceCloseButton = false,
    this.previousRoute,
  });

  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final bool forceCloseButton;
  final PageRouteInfo? previousRoute;

  static IconData getIconData(BuildContext context) {
    final platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return Icons.arrow_back;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return Icons.arrow_back_ios;
    }
  }

  static CmPopButton? buildIfBackable(
    BuildContext context, {
    PageRouteInfo? previousRoute,
    bool forceCloseButton = false,
    void Function()? onPressed,
    Color? color,
    Color? backgroundColor,
  }) {
    bool canPop = context.router.canPop();
    if (!canPop && previousRoute == null) return null;
    return CmPopButton(
      previousRoute: previousRoute,
      forceCloseButton: forceCloseButton,
      onPressed: onPressed,
      color: color,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    ModalRoute<Object?>? parentRoute = ModalRoute.of(context);
    bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog ||
            forceCloseButton;

    return Center(
      child: VmIconButton(
        backgroundColor: backgroundColor,
        icon: IconTheme.merge(
          data: IconThemeData(size: ConfigConstant.iconSize2, color: color),
          child: useCloseButton
              ? const Icon(Icons.close)
              : const Icon(Icons.arrow_back), // const BackButtonIcon(),
        ),
        tooltip: useCloseButton
            ? MaterialLocalizations.of(context).closeButtonLabel
            : MaterialLocalizations.of(context).backButtonTooltip,
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          } else if (context.findAncestorWidgetOfExactType<RouteDataScope>() !=
                  null &&
              previousRoute != null) {
            context.navigateTo(previousRoute!);
          } else {
            context.router.maybePopTop();
          }
        },
      ),
    );
  }
}
