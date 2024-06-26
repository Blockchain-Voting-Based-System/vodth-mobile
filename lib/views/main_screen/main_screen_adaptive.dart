part of 'main_screen_view.dart';

class _MainScreenAdaptive extends StatelessWidget {
  const _MainScreenAdaptive(this.viewModel);

  final MainScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        // PrivateVoteRoute(),
        HistoryRoute(),
        AccountRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavBar(tabsRouter: tabsRouter),
        );
      },
    );
  }
}
