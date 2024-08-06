part of 'casting_vote_view.dart';

class _CastingVoteAdaptive extends StatelessWidget {
  const _CastingVoteAdaptive(this.viewModel);

  final CastingVoteViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    VotingProvider votingProvider = context.watch<VotingProvider>();

    return Scaffold(
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (context, child) {
          return SafeArea(
            child: buildDefaultStepper(context),
          );
        },
      ),
      // bottomNavigationBar: ValueListenableBuilder<bool>(
      //     valueListenable: ValueNotifier(votingProvider.validSecret),
      //     builder: (context, value, child) {
      //       return VmBottomNavigationWrapper.doubleActions(
      //         context: context,
      //         leftButton: VmButton.outlined(
      //           label: 'Back',
      //           onPressed: () => context.router.popForced(),
      //         ),
      //         rightButton: VmButton.filled(
      //           label: 'Continue',
      //           onPressed: value ? viewModel.nextStep : null,
      //         ),
      //       );
      //     }),
    );
  }

  Widget buildDefaultStepper(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: Stepper(
        onStepTapped: viewModel.goToStep,
        connectorThickness: 2,
        elevation: 0,
        stepIconHeight: 32,
        stepIconWidth: 32,
        stepIconBuilder: (stepIndex, stepState) {
          final icons = [
            const Icon(Icons.perm_identity, color: Colors.white),
            const Icon(Icons.check_box_outlined, color: Colors.white),
            const Icon(Icons.how_to_vote, color: Colors.white),
          ];
          return SizedBox(
            width: 32,
            height: 32,
            child: Center(child: icons[stepIndex]),
          );
        },
        type: StepperType.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        currentStep: viewModel.currentStep,
        onStepContinue: viewModel.nextStep,
        onStepCancel: viewModel.previousStep,
        steps: [
          // buildStep(
          //   context,
          //   title: 'Identity',
          //   content: StepperIdentityContent(viewModel: viewModel),
          //   isActive: viewModel.currentStep >= 0,
          //   state: viewModel.currentStep == 0 ? StepState.editing : StepState.complete,
          // ),
          buildStep(
            context,
            title: 'Selection',
            content: StepperSelectionContent(viewModel: viewModel),
            isActive: viewModel.currentStep >= 1,
            state: viewModel.currentStep == 1 ? StepState.editing : StepState.complete,
          ),
          buildStep(
            context,
            title: 'Vote',
            content: const StepperVoteContent(),
            isActive: viewModel.currentStep >= 1,
            state: viewModel.currentStep == 1 ? StepState.editing : StepState.complete,
          ),
        ],
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Container(); // Return an empty container to remove default buttons
        },
      ),
    );
  }

  Step buildStep(
    BuildContext context, {
    required String title,
    required Widget content,
    required bool isActive,
    required StepState state,
  }) {
    return Step(
      title: Text(title),
      content: content,
      isActive: isActive,
      state: state,
    );
  }
}
