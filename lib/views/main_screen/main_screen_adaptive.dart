part of main_screen;

class _MainScreenAdaptive extends StatelessWidget {
  const _MainScreenAdaptive(this.viewModel);

  final MainScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        CandidatesRoute(),
        VoteResultRoute(),
        SettingRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: child,
          bottomNavigationBar: BottomNavBar(tabsRouter: tabsRouter),
        );
      },
    );
  }
}
