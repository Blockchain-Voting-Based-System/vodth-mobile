library event;

import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';

import 'event_view_model.dart';
part 'event_adaptive.dart';

@RoutePage()
class EventView extends StatelessWidget {
  const EventView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<EventViewModel>(
      create: (context) => EventViewModel(),
      builder: (context, viewModel, child) {
        return _EventAdaptive(viewModel);
      },
    );
  }
}
