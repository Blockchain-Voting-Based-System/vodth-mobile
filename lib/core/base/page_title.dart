import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/themes/theme_constant.dart';

// One use case is to dynamically set page title on web.
// Title() widget said that it also for "Creates a widget that describes this app to the Android operating system."
// but haven't tested it.
class PageTitle<T extends BaseViewModel> extends StatefulWidget {
  const PageTitle({
    super.key,
    required this.onGenerateTitle,
    required this.onGenerateTitleColor,
    required this.viewModel,
    required this.child,
  });

  final Future<String?> Function(T) onGenerateTitle;
  final Color Function(T)? onGenerateTitleColor;
  final T viewModel;
  final Widget child;

  @override
  State<PageTitle<T>> createState() => PageTitleState<T>();
}

class PageTitleState<T extends BaseViewModel> extends State<PageTitle<T>>
    with AutoRouteAwareStateMixin {
  String? title;
  AutoRouteObserver? _observer;

  @override
  void initState() {
    widget.onGenerateTitle.call(widget.viewModel).then((value) {
      setState(() => title = value);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _observer =
        RouterScope.of(context).firstObserverOfType<AutoRouteObserver>();
    if (_observer != null) {
      _observer?.subscribe(this, context.routeData);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _observer?.unsubscribe(this);
  }

  // when pop from next page, setState to restart the title.
  @override
  void didPopNext() {
    setState(() {});
    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    if (title == null) return widget.child;
    return Title(
      color: widget.onGenerateTitleColor?.call(widget.viewModel) ??
          ThemeConstant.brandColor,
      title: '$title - BookMe+',
      child: widget.child,
    );
  }
}
