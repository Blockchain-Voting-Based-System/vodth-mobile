library private_vote;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';
import 'package:vodth_mobile/core/theme/m3/m3_text_theme.dart';

import 'private_vote_view_model.dart';

part 'private_vote_adaptive.dart';

@RoutePage()
class PrivateVoteView extends StatelessWidget {
  const PrivateVoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<PrivateVoteViewModel>(
      create: (context) => PrivateVoteViewModel(),
      builder: (context, viewModel, child) {
        return _PrivateVoteAdaptive(viewModel);
      },
    );
  }
}
