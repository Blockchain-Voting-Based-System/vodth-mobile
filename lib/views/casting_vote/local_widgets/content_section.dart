import 'package:flutter/material.dart';

class ContentSection extends StatelessWidget {
  const ContentSection({
    super.key,
    this.description,
    this.inputWidget,
  });

  final String? description;
  final Widget? inputWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (description?.isNotEmpty ?? false)
          Text(
            description ?? 'N/A',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        if (description?.isNotEmpty ?? false) const SizedBox(height: 20),
        const SizedBox(
          height: 16,
        ),
        if (inputWidget != null) inputWidget ?? const SizedBox(),
      ],
    );
  }
}
