library vote_result;

import 'package:vodth_mobile/constant/config_constant.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/views/vote_result/local_widgets/result_bar_chart.dart';
import 'package:vodth_mobile/views/vote_result/local_widgets/result_pie_chart.dart';

import 'vote_result_view_model.dart';
part 'vote_result_adaptive.dart';

@RoutePage()
class VoteResultView extends StatelessWidget {
  const VoteResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<VoteResultViewModel>(
      create: (context) => VoteResultViewModel(),
      builder: (context, viewModel, child) {
        return _VoteResultAdaptive(viewModel);
      },
    );
  }
}
