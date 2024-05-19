import 'package:flutter/material.dart';

enum VodthTapEffectType {
  touchableOpacity,
  scaleDown,
}

class VodthTapEffect extends StatefulWidget {
  const VodthTapEffect({
    Key? key,
    required this.child,
    required this.onTap,
    this.duration = const Duration(milliseconds: 100),
    this.vibrate = false,
    this.behavior = HitTestBehavior.opaque,
    this.effects = const [
      VodthTapEffectType.touchableOpacity,
    ],
    this.onLongPressed,
  }) : super(key: key);

  final Widget child;
  final List<VodthTapEffectType> effects;
  final void Function()? onTap;
  final void Function()? onLongPressed;
  final Duration duration;
  final bool vibrate;
  final HitTestBehavior? behavior;

  @override
  State<VodthTapEffect> createState() => _VodthTapEffectState();
}

class _VodthTapEffectState extends State<VodthTapEffect>
    with SingleTickerProviderStateMixin {
  final double scaleActive = 0.98;
  final double opacityActive = 0.2;
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;
  late Animation<double> borderAnimation;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: widget.duration);
    scaleAnimation =
        Tween<double>(begin: 1, end: scaleActive).animate(controller);
    opacityAnimation =
        Tween<double>(begin: 1, end: opacityActive).animate(controller);
    borderAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onTap() {
    if (widget.onTap != null) widget.onTap!();
    Feedback.forTap(context);
  }

  void onTapCancel() => controller.reverse();
  void onTapDown() => controller.forward();
  void onTapUp() {
    onTap();
    controller.reverse();
  }

  void onDoubleTap() async {
    controller.forward().then((value) => controller.reverse());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onTap != null) {
      return MouseRegion(
        onEnter: (e) => onTapDown(),
        onExit: (e) => onTapCancel(),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          behavior: widget.behavior,
          onLongPress: widget.onLongPressed,
          onTapDown: (detail) => onTapDown(),
          onTapUp: (detail) => onTapUp(),
          onTapCancel: () => onTapCancel(),
          child: buildChild(controller),
        ),
      );
    } else {
      return buildChild(controller);
    }
  }

  AnimatedBuilder buildChild(AnimationController controller) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        Widget result = child ?? const SizedBox();
        for (var effect in widget.effects) {
          switch (effect) {
            case VodthTapEffectType.scaleDown:
              result = ScaleTransition(scale: scaleAnimation, child: result);
              break;
            case VodthTapEffectType.touchableOpacity:
              result = Opacity(opacity: opacityAnimation.value, child: result);
              break;
          }
        }
        return result;
      },
      child: widget.child,
    );
  }
}
