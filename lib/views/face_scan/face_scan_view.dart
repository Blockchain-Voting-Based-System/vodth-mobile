library face_scan;

import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';

import 'face_scan_view_model.dart';
part 'face_scan_adaptive.dart';

@RoutePage()
class FaceScanView extends StatelessWidget {
  const FaceScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<FaceScanViewModel>(
      create: (context) => FaceScanViewModel(),
      builder: (context, viewModel, child) {
        return _FaceScanAdaptive(viewModel);
      },
    );
  }
}
