library events;

import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';
import 'package:vodth_mobile/views/main_screen/local_widgets/bottom_nav_bar.dart';

import 'events_view_model.dart';
part 'events_adaptive.dart';

@RoutePage()
class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<EventsViewModel>(
      create: (context) => EventsViewModel(),
      builder: (context, viewModel, child) {
        return _EventsAdaptive(viewModel);
      },
    );
  }
}
