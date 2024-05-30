library account;

import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/theme/theme_constant.dart';

import 'account_view_model.dart';

part 'account_adaptive.dart';

@RoutePage()
class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<AccountViewModel>(
      create: (context) => AccountViewModel(),
      builder: (context, viewModel, child) {
        return _AccountAdaptive(viewModel);
      },
    );
  }
}
