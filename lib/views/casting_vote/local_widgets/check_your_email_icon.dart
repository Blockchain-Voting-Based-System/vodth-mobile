import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';

class CheckYourEmailIcon extends StatelessWidget {
  const CheckYourEmailIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: M3Color.of(context).primary.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Icon(
        Icons.key,
        size: 50,
        color: Colors.white,
      ),
    );
  }
}
