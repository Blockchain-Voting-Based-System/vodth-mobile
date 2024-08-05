library history_detail;

import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';
import 'package:vodth_mobile/views/history_detail/local_widgets/history_result.dart';

import 'history_detail_view_model.dart';
part 'history_detail_adaptive.dart';

@RoutePage()
class HistoryDetailView extends StatelessWidget {
  // const HistoryDetailView({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return ViewModelProvider<HistoryDetailViewModel>(
  //     create: (context) => HistoryDetailViewModel(),
  //     builder: (context, viewModel, child) {
  //       return _HistoryDetailAdaptive(viewModel);
  //     },
  //   );
  // }

  final String? id;

  const HistoryDetailView({
    super.key,
    @PathParam('id') required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HistoryDetailViewModel>(
      create: (context) => HistoryDetailViewModel(
        params: HistoryDetailRouteArgs(id: id),
      ),
      builder: (context, viewModel, child) {
        return _HistoryDetailAdaptive(viewModel);
      },
    );
  }
}
