import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/theme/m3/m3_text_theme.dart';

class VmSuiAddress extends StatelessWidget {
  const VmSuiAddress({super.key});

  @override
  Widget build(BuildContext context) {
    String fullAddress =
        '0x2b42771d127c7aee2ef9fefc054d00e87adab986ccaf7c5386aa07df7bce9b0b';
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
