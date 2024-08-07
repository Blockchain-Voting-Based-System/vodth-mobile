library history_detail;

import 'package:url_launcher/url_launcher.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';
import 'package:vodth_mobile/views/event_detail/local_widgets/event_result.dart';
import 'package:vodth_mobile/views/history/history_detail/local_widgets/history_result.dart';
import 'package:vodth_mobile/views/widgets/vm_bottom.dart';
import 'package:vodth_mobile/views/widgets/vm_bottom_navigation_wrapper.dart';

import 'history_detail_view_model.dart';
part 'history_detail_adaptive.dart';

@RoutePage()
class HistoryDetailView extends StatelessWidget {
  final String? id;

  const HistoryDetailView({
    super.key,
    @PathParam('id') required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HistoryDetailViewModel>(
      create: (context) => HistoryDetailViewModel(
        params: HistoryDetailRouteArgs(id:id),
      ),
      builder: (context, viewModel, child) {
        return _HistoryDetailAdaptive(viewModel);
      },
    );
  }
}
