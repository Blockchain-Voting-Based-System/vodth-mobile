library id_card_upload;

import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';

import 'id_card_upload_view_model.dart';
part 'id_card_upload_adaptive.dart';

@RoutePage()
class IdCardUploadView extends StatelessWidget {
  const IdCardUploadView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<IdCardUploadViewModel>(
      create: (context) => IdCardUploadViewModel(),
      builder: (context, viewModel, child) {
        return _IdCardUploadAdaptive(viewModel);
      },
    );
  }
}
