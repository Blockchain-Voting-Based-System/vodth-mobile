library capture_id;

import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';

import 'capture_id_view_model.dart';
part 'capture_id_adaptive.dart';

@RoutePage()
class CaptureIdView extends StatelessWidget {
  const CaptureIdView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CaptureIdViewModel>(
      create: (context) => CaptureIdViewModel(),
      builder: (context, viewModel, child) {
        return _CaptureIdAdaptive(viewModel);
      },
    );
  }
}
