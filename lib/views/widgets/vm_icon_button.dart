import 'package:flutter/material.dart';
import 'package:vodth_mobile/views/widgets/vm_tap_effect.dart';

class VmIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final double size;
  final EdgeInsets padding;
  final String? tooltip;
  final Color? backgroundColor;
  final EdgeInsets margin;

  const VmIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.onLongPress,
    this.size = 24.0,
    this.padding = const EdgeInsets.all(8),
    this.tooltip,
    this.backgroundColor,
    this.margin = const EdgeInsets.all(4),
  });

  @override
  Widget build(BuildContext context) {
    Widget button = Material(
      type: backgroundColor == null
          ? MaterialType.transparency
          : MaterialType.circle,
      color: backgroundColor,
      child: buildPlatformWrapper(
        child: icon,
        context: context,
      ),
    );

    if (tooltip != null) {
      button = Tooltip(
        message: tooltip ?? '',
        child: button,
      );
    }

    return Container(
      padding: const EdgeInsets.all(4),
      margin: margin,
      child: button,
    );
  }

  Widget buildPlatformWrapper({
    required Widget child,
    required BuildContext context,
  }) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          onLongPress: onLongPress,
          child: Padding(
            padding: padding,
            child: icon,
          ),
        );
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return VmTapEffect(
          onTap: onPressed,
          onLongPressed: onLongPress,
          child: Padding(
            padding: padding,
            child: icon,
          ),
        );
    }
  }
}
