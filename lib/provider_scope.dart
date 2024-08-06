import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vodth_mobile/providers/event_provider.dart';
import 'package:vodth_mobile/providers/theme_provider.dart';
import 'package:vodth_mobile/providers/voting_provider.dart';

// global providers
class ProviderScope extends StatelessWidget {
  const ProviderScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<EventProvider>(
          create: (context) => EventProvider(),
        ),
        ListenableProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ListenableProvider<VotingProvider>(
          create: (context) => VotingProvider(),
        ),
      ],
      child: child,
    );
  }
}
