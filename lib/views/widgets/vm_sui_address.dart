import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/theme/m3/m3_text_theme.dart';

class VmSuiAddress extends StatelessWidget {
  const VmSuiAddress({super.key});

  @override
  Widget build(BuildContext context) {
    String fullAddress =
        '0xd53cb47969f2ac3e9d11d126c2994e6549e7967e2583ab55ea057f0bb760d1cc';
    String formattedAddress = formatAddress(fullAddress);

    return Expanded(
      child: Text(
        formattedAddress,
        style: M3TextTheme.of(context).titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }

  String formatAddress(String address) {
    if (address.length > 12) {
      return '${address.substring(0, 10)}...${address.substring(address.length - 10)}';
    }
    return address;
  }
}
