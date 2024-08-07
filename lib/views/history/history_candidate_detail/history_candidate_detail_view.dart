library history_candidate_detail;

import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vodth_mobile/constant/config_constant.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';
import 'package:vodth_mobile/views/widgets/vm_bottom.dart';
import 'package:vodth_mobile/views/widgets/vm_bottom_navigation_wrapper.dart';

import 'history_candidate_detail_view_model.dart';
part 'history_candidate_detail_adaptive.dart';

@RoutePage()
class HistoryCandidateDetailView extends StatelessWidget {
 final String? id;

  const HistoryCandidateDetailView({super.key, @PathParam('id') required this.id});
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HistoryCandidateDetailViewModel>(
      create: (context) => HistoryCandidateDetailViewModel(
        params: HistoryCandidateDetailRouteArgs(id: id),
      ),
      builder: (context, viewModel, child) {
        return _HistoryCandidateDetailAdaptive(viewModel);
      },
    );
  }
}
