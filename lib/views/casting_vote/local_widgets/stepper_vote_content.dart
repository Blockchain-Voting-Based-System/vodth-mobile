import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';
import 'package:vodth_mobile/views/casting_vote/casting_vote_view_model.dart';
import 'package:vodth_mobile/views/casting_vote/local_widgets/title_section.dart';

class StepperVoteContent extends StatelessWidget {
  const StepperVoteContent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CastingVoteViewModel>(context);

    return Column(
      children: [
        Divider(thickness: 2, color: M3Color.of(context).primary),
        const SizedBox(height: 8),
        const TitleSection(
          title: 'Confirm Vote',
        ),
        const SizedBox(
          height: 70,
        ),
        Container(
          width: 400,
          height: 400,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/gifs/voting.gif'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        swipeButton(context, viewModel),
      ],
    );
  }

  Widget swipeButton(BuildContext context, CastingVoteViewModel viewModel) {
    return SwipeableButtonView(
      buttonText: "Swipe to Confirm",
      buttonWidget: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.grey,
      ),
      activeColor: M3Color.of(context).primary,
      isFinished: viewModel.isFinished,
      onWaitingProcess: () {
        viewModel.voteCandidate(context);
      },
      onFinish: () {
        viewModel.resetIsFinished();

        context.router.pushAndPopUntil(
          EventDetailRoute(id: viewModel.event?.id),
          predicate: (_) => false,
        );
      },
    );
  }
}
