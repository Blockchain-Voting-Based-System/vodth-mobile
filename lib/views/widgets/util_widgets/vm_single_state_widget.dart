import 'package:flutter/material.dart';

class VmSingleStateWidget<T> extends StatefulWidget {
  const VmSingleStateWidget({
    super.key,
    required this.initialValue,
    required this.builder,
  });

  final T initialValue;
  final Widget Function(BuildContext context, ValueNotifier<T> notifier) builder;

  @override
  State<VmSingleStateWidget<T>> createState() => _VmSingleStateWidgetState<T>();
}

class _VmSingleStateWidgetState<T> extends State<VmSingleStateWidget<T>> {
  late final ValueNotifier<T> stateNotifier;

  @override
  void initState() {
    stateNotifier = ValueNotifier<T>(widget.initialValue);
    super.initState();
  }

  @override
  void dispose() {
    stateNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      stateNotifier,
    );
  }
}
