library casting_vote;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';

import 'casting_vote_view_model.dart';
part 'casting_vote_adaptive.dart';
 
@RoutePage()
class CastingVoteView extends StatelessWidget {
  const CastingVoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CastingVoteViewModel>(
      create: (context) => CastingVoteViewModel(),
      builder: (context, viewModel, child) {
        return _CastingVoteAdaptive(viewModel);
      },
    );
  }
}
