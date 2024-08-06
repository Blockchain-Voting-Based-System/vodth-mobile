part of 'casting_vote_view.dart';

class _CastingVoteAdaptive extends StatelessWidget {
  const _CastingVoteAdaptive(this.viewModel);

  final CastingVoteViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (context, child) {
          final screenHeight = MediaQuery.of(context).size.height;
          final columnHeight = screenHeight * 0.3;
          return SafeArea(
            child: buildDefaultStepper(context, columnHeight),
          );
        },
      ),
    );
  }

  Widget buildDefaultStepper(BuildContext context, double columnHeight) {
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
          if (viewModel.event?.type == 'public')
            buildStep(
              context,
              title: 'Identity',
              content: StepperPublicIdentityContent(viewModel: viewModel),
              isActive: viewModel.currentStep >= 0,
              state: viewModel.currentStep == 0
                  ? StepState.editing
                  : StepState.complete,
            )
          else
            buildStep(
              context,
              title: 'Identity',
              content: StepperPrivateIdentityContent(viewModel: viewModel),
              isActive: viewModel.currentStep >= 0,
              state: viewModel.currentStep == 0
                  ? StepState.editing
                  : StepState.complete,
            ),
          buildStep(
            context,
            title: 'Selection',
            content: StepperSelectionContent(viewModel: viewModel),
            isActive: viewModel.currentStep >= 1,
            state: viewModel.currentStep == 1
                ? StepState.editing
                : StepState.complete,
          ),
          buildStep(
            context,
            title: 'Vote',
            content: const StepperVoteContent(),
            isActive: viewModel.currentStep >= 2,
            state: viewModel.currentStep == 2
                ? StepState.editing
                : StepState.complete,
          ),
        ],
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Container(); // Return an empty container to remove default buttons
        },
      ),
    );
  }

  Step buildStep(BuildContext context,
      {required String title,
      required Widget content,
      required bool isActive,
      required StepState state}) {
    return Step(
      title: Text(title),
      content: content,
      isActive: isActive,
      state: state,
    );
  }
}
