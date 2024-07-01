library candidate_detail;

import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:vodth_mobile/constant/config_constant.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/services/messenger_service.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';
import 'package:vodth_mobile/core/theme/m3/m3_text_theme.dart';
import 'package:vodth_mobile/themes/theme_constant.dart';
import 'package:vodth_mobile/views/widgets/vm_bottom.dart';
import 'package:vodth_mobile/views/widgets/vm_bottom_navigation_wrapper.dart';

import 'candidate_detail_view_model.dart';

part 'candidate_detail_adaptive.dart';

@RoutePage()
class CandidateDetailView extends StatelessWidget {
  final String? id;
  final String? suiEventId;

  const CandidateDetailView({
    super.key,
    @PathParam('id') required this.id,
    @QueryParam('suiEventId') required this.suiEventId,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CandidateDetailViewModel>(
      create: (context) => CandidateDetailViewModel(
          params: CandidateDetailRouteArgs(
        id: id,
        suiEventId: suiEventId,
      )),
      builder: (context, viewModel, child) {
        return _CandidateDetailAdaptive(viewModel);
      },
    );
  }
}
