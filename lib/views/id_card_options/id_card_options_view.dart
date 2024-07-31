library id_card_options;

import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:vodth_mobile/constant/config_constant.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/views/id_card_options/local_widgets/id_card_type_tile.dart';

import 'id_card_options_view_model.dart';
part 'id_card_options_adaptive.dart';

@RoutePage()
class IdCardOptionsView extends StatelessWidget {
  const IdCardOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<IdCardOptionsViewModel>(
      create: (context) => IdCardOptionsViewModel(),
      builder: (context, viewModel, child) {
        return _IdCardOptionsAdaptive(viewModel);
      },
    );
  }
}
