library account;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:vodth_mobile/constant/config_constant.dart';
import 'package:vodth_mobile/core/base/view_model_provider.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';
import 'package:vodth_mobile/core/theme/m3/m3_text_theme.dart';
import 'package:vodth_mobile/core/theme/theme_config.dart';
import 'package:vodth_mobile/core/theme/theme_constant.dart';
import 'package:vodth_mobile/themes/theme_constant.dart';
import 'package:vodth_mobile/views/widgets/vm_app_bar.dart';
import 'package:vodth_mobile/views/widgets/vm_sui_address.dart';

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
