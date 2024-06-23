import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/base/page_title.dart';
import 'package:vodth_mobile/themes/theme_constant.dart';

class ViewModelProvider<T extends BaseViewModel> extends StatelessWidget {
  const ViewModelProvider({
    super.key,
    required this.builder,
    required this.create,
    this.onGenerateTitle,
    this.onGenerateTitleColor,
    this.root = false,
    this.child,
  });

  final Create<T> create;
  final Future<String?> Function(T)? onGenerateTitle;
  final Color Function(T)? onGenerateTitleColor;
  final Widget? child;
  final Widget Function(BuildContext context, T viewModel, Widget? child)
      builder;
  final bool root;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) => create(context),
      child: child,
      builder: (context, child) {
        T viewModel = Provider.of<T>(context);

        return buildTitle(
          context: context,
          viewModel: viewModel,
          child: builder(context, viewModel, child),
        );
      },
    );
  }

  Widget buildTitle({
    required BuildContext context,
    required T viewModel,
    required Widget child,
  }) {
    // let child handle page title.
    if (root) return child;

    // if not in router, no need to update page title.
    if (context.findAncestorWidgetOfExactType<RouteDataScope>() == null) {
      return child;
    }

    if (onGenerateTitle != null) {
      return PageTitle<T>(
        onGenerateTitle: onGenerateTitle!,
        onGenerateTitleColor: onGenerateTitleColor,
        viewModel: viewModel,
        child: child,
      );
    } else {
      return Title(
        color:
            onGenerateTitleColor?.call(viewModel) ?? ThemeConstant.brandColor,
        title: 'Vodth+ | Official Site',
        child: child,
      );
    }
  }
}
