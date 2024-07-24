library id_card_ocr;

import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';

import 'id_card_ocr_view_model.dart';
part 'id_card_ocr_adaptive.dart';

@RoutePage()
class IdCardOcrView extends StatelessWidget {
  const IdCardOcrView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<IdCardOcrViewModel>(
      create: (context) => IdCardOcrViewModel(),
      builder: (context, viewModel, child) {
        return _IdCardOcrAdaptive(viewModel);
      },
    );
  }
}
