library national_id_card_ocr;

import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';

import 'national_id_card_ocr_view_model.dart';
part 'national_id_card_ocr_adaptive.dart';

@RoutePage()
class NationalIdCardOcrView extends StatelessWidget {
  const NationalIdCardOcrView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<NationalIdCardOcrViewModel>(
      create: (context) => NationalIdCardOcrViewModel(),
      builder: (context, viewModel, child) {
        return _NationalIdCardOcrAdaptive(viewModel);
      },
    );
  }
}
