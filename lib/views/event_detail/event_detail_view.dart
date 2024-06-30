library event_detail;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';

import 'event_detail_view_model.dart';

part 'event_detail_adaptive.dart';

@RoutePage()
class EventDetailView extends StatelessWidget {
  final String? id;

  const EventDetailView({
    super.key,
    @PathParam('id') required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<EventDetailViewModel>(
      create: (context) => EventDetailViewModel(
        params: EventDetailRouteArgs(id: id),
      ),
      builder: (context, viewModel, child) {
        return _EventDetailAdaptive(viewModel);
      },
    );
  }
}
