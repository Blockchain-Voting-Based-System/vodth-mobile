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
          double screenHeight = MediaQuery.of(context).size.height;
          double columnHeight = screenHeight * 0.7;
          return SafeArea(
              child: buildDefaultStepper(context, columnHeight, screenHeight));
        },
      ),
    );
  }

  Widget buildDefaultStepper(
      BuildContext context, double columnHeight, double screenHeight) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Stepper(
          connectorThickness: 2,
          elevation: 0,
          stepIconHeight: 32,
          stepIconWidth: 32,
          stepIconBuilder: (stepIndex, stepState) {
            final List<Icon> icons = [
              const Icon(Icons.perm_identity, color: Colors.white),
              const Icon(Icons.check_box_outlined, color: Colors.white),
              const Icon(Icons.how_to_vote, color: Colors.white),
            ];

            final icon = icons[stepIndex];

            return SizedBox(
              width: 32,
              height: 32,
              child: Center(
                child: icon,
              ),
            );
          },
          type: StepperType.horizontal,
          currentStep: viewModel.currentStep,
          onStepContinue: viewModel.nextStep,
          onStepCancel: viewModel.previousStep,
          steps: [
            Step(
              title: const Text(
                'Identity',
              ),
              content: SizedBox(
                height: columnHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    titleSection(context, 'Enter Secret Key'),
                    contentSection(
                      'Please enter the secret key that was sent to your email',
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Secret Key',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    actionCancelNext(
                      viewModel.nextStep,
                      context,
                    ),
                  ],
                ),
              ),
              stepStyle:
                  const StepStyle(indexStyle: TextStyle(color: Colors.black)),
              isActive: viewModel.currentStep >= 0,
              state: viewModel.currentStep == 0
                  ? StepState.editing
                  : StepState.complete,
            ),
            Step(
              title: const Text(
                'Selection',
              ),
              content: SizedBox(
                height: columnHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleSection(context, 'Select A Candidate'),
                    contentSection(
                      '',
                      const Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(child: Icon(Icons.person)),
                            title: Text('Candidate 1'),
                          ),
                          ListTile(
                            leading: CircleAvatar(child: Icon(Icons.person)),
                            title: Text('Candidate 2'),
                          ),
                        ],
                      ),
                    ),
                    actionPreviousNext(
                      viewModel.previousStep,
                      viewModel.nextStep,
                      context,
                    ),
                  ],
                ),
              ),
              isActive: viewModel.currentStep >= 1,
              state: viewModel.currentStep == 1
                  ? StepState.editing
                  : StepState.complete,
            ),
            Step(
              title: const Text(
                'Vote',
              ),
              content: SizedBox(
                height: columnHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleSection(context, 'Confirm Vote'),
                    contentSection(
                      '',
                      Image.asset('assets/gifs/voting.gif'),
                    ),
                    swipeButton(context),
                  ],
                ),
              ),
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
      ),
    );
  }

  Widget titleSection(BuildContext context, String title) {
    return Column(
      children: [
        Divider(
          thickness: 2,
          color: M3Color.of(context).primary,
        ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: M3Color.of(context).primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget contentSection(String description, Widget inputWidget) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (description.isNotEmpty)
          Center(
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        if (description.isNotEmpty) const SizedBox(height: 20),
        inputWidget,
      ],
    );
  }

  Widget actionPreviousNext(VoidCallback onStepPrevious,
      VoidCallback onStepContinue, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ElevatedButton(
          onPressed: onStepPrevious,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.grey.shade300,
            foregroundColor: Colors.black,
          ).copyWith(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Back'),
          ),
        ),
        ElevatedButton(
          onPressed: onStepContinue,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: M3Color.of(context).primary,
            foregroundColor: Colors.white,
          ).copyWith(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Continue'),
          ),
        ),
      ],
    );
  }

  Widget actionCancelNext(VoidCallback onStepContinue, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ElevatedButton(
          onPressed: Navigator.of(context).pop,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.grey.shade300,
            foregroundColor: Colors.black,
          ).copyWith(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Cancel'),
          ),
        ),
        ElevatedButton(
          onPressed: onStepContinue,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: M3Color.of(context).primary,
            foregroundColor: Colors.white,
          ).copyWith(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Continue'),
          ),
        ),
      ],
    );
  }

  Widget swipeButton(BuildContext context) {
    return SwipeableButtonView(
        buttonText: "Swipe to Confirm",
        buttonWidget: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.grey,
        ),
        activeColor: M3Color.of(context).primary,
        // isFinished: isFinished,
        onWaitingProcess: () {},
        onFinish: () {
          print('finish');
        });
  }
}
