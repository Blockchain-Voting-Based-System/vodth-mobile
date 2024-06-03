part of 'vote_option_view.dart';

class _VoteOptionAdaptive extends StatelessWidget {
  const _VoteOptionAdaptive(this.viewModel);

  final VoteOptionViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildContent(context),
    );
  }

  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildTitle(context),
        const SizedBox(height: 30),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              buildVoteOptionButton(context, 'Private'),
              const SizedBox(height: 20),
              buildVoteOptionButton(context, 'Public'),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTitle(BuildContext context) {
    return Text(
      'VOTE OPTION',
      style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Widget buildVoteOptionButton(
    BuildContext context,
    String label,
  ) {
    return SizedBox(
      width: 370,
      height: 70,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: ThemeConstant.brandColor,
        ),
        onPressed: () {
          context.router.push(const IdCardRoute());
        },
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
