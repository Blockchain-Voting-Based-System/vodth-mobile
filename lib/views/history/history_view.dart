library history;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sui/sui_client.dart';
import 'package:sui/sui_urls.dart';
import 'package:sui/types/objects.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:vodth_mobile/constant/config_constant.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';
import 'package:vodth_mobile/core/theme/m3/m3_text_theme.dart';
import 'package:vodth_mobile/views/home/local_widgets/events_list.dart';

import 'history_view_model.dart';

part 'history_adaptive.dart';

@RoutePage()
class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HistoryViewModel>(
      create: (context) => HistoryViewModel(),
      builder: (context, viewModel, child) {
        return _HistoryAdaptive(viewModel);
      },
    );
  }
}
