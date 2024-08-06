library upload_id;

import 'package:flutter/material.dart';
import 'package:vodth_mobile/constant/config_constant.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';
import 'package:vodth_mobile/views/casting_vote/casting_vote_view_model.dart';
import 'package:vodth_mobile/views/casting_vote/local_widgets/action_button.dart';
import 'package:vodth_mobile/views/casting_vote/upload_id/local_widgets/upload_id_action_button.dart';

import 'upload_id_view_model.dart';

part 'upload_id_adaptive.dart';

@RoutePage()
class UploadIdView extends StatelessWidget {
  const UploadIdView({
    super.key,
    required this.cardType,
    required this.castingVoteViewModel,
  });

  final String cardType;
  final CastingVoteViewModel castingVoteViewModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<UploadIdViewModel>(
      create: (context) => UploadIdViewModel(cardType: cardType),
      builder: (context, viewModel, child) {
        return _UploadIdAdaptive(viewModel, castingVoteViewModel);
      },
    );
  }
}
