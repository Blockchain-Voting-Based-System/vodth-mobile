part of 'welcome_view.dart';

class _WelcomeAdaptive extends StatelessWidget {
  const _WelcomeAdaptive(this.viewModel);

  final WelcomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildVodthLogo(context),
          const SizedBox(height: 30),
          buildWelcomeMessage(context),
        ],
      ),
      bottomNavigationBar: buildStartButton(context),
    );
  }

  Widget buildVodthLogo(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          'assets/vodth/vodth_logo.png',
          height: 200,
        ),
      ],
    );
  }

  Widget buildWelcomeMessage(BuildContext context) {
    return Text(
      'Where every decision you made will be anonymous',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displaySmall,
    );
  }

  Widget buildStartButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 38, horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: const Color(0xff004AAD),
          ),
          onPressed: () {
            context.router.push(const VoteOptionRoute());
          },
          child: Text(
            'Start',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
