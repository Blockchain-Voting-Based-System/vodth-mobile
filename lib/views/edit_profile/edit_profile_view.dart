library edit_profile;

import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';

import 'edit_profile_view_model.dart';
part 'edit_profile_adaptive.dart';

@RoutePage()
class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<EditProfileViewModel>(
      create: (context) => EditProfileViewModel(),
      builder: (context, viewModel, child) {
        return _EditProfileAdaptive(viewModel);
      },
    );
  }
}
