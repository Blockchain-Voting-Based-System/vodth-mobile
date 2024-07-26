library id_card_validation;

import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';

import 'id_card_validation_view_model.dart';
part 'id_card_validation_adaptive.dart';

@RoutePage()
class IdCardValidationView extends StatelessWidget {
  const IdCardValidationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<IdCardValidationViewModel>(
      create: (context) => IdCardValidationViewModel(),
      builder: (context, viewModel, child) {
        return _IdCardValidationAdaptive(viewModel);
      },
    );
  }
}
