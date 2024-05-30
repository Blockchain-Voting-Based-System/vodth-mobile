import 'package:flutter/material.dart';

class VmAppBar extends StatelessWidget {
  const VmAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }
}
