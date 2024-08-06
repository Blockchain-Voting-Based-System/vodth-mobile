import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';

class UploadIdActionButton extends StatelessWidget {
  const UploadIdActionButton({
    super.key,
    required this.buttonTitle,
    required this.icon,
    this.onTap,
  });

  final String buttonTitle;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: M3Color.of(context).primary, // Background color
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Text(
              buttonTitle,
              style: const TextStyle(
                color: Colors.white, // Text color
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
