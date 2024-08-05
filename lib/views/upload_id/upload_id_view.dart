library upload_id;

import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:vodth_mobile/constant/config_constant.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';
import 'package:vodth_mobile/views/upload_id/local_widgets/action_button.dart';

import 'upload_id_view_model.dart';
part 'upload_id_adaptive.dart';

@RoutePage()
class UploadIdView extends StatelessWidget {
  const UploadIdView({super.key, required this.cardType});

  final String cardType;

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<UploadIdViewModel>(
      create: (context) => UploadIdViewModel(cardType: cardType),
      builder: (context, viewModel, child) {
        return _UploadIdAdaptive(viewModel);
      },
    );
  }
}
