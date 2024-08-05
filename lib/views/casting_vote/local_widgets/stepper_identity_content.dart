import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';
import 'package:vodth_mobile/views/casting_vote/casting_vote_view_model.dart';
import 'package:vodth_mobile/views/casting_vote/local_widgets/action_button.dart';
import 'package:vodth_mobile/views/casting_vote/local_widgets/check_your_email_icon.dart';
import 'package:vodth_mobile/views/casting_vote/local_widgets/content_section.dart';

class StepperIdentityContent extends StatelessWidget {
  const StepperIdentityContent({
    super.key,
    required this.viewModel,
  });
  final CastingVoteViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Divider(thickness: 2, color: M3Color.of(context).primary),
        const SizedBox(
          height: 50,
        ),
        const CheckYourEmailIcon(),
        const SizedBox(
          height: 50,
        ),
        Text(
          'Enter Secret Key',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: M3Color.of(context).primary,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ContentSection(
          description:
              'Please enter the secret key that was sent to your email',
          inputWidget: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Secret Key',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 10.0,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 250,
        ),
        actionCancelNext(viewModel.nextStep, context),
      ],
    );
  }

  Widget actionCancelNext(VoidCallback onStepContinue, BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ActionButton(
            text: 'Cancel',
            onPressed: Navigator.of(context).pop,
            color: Colors.grey.shade300,
            textColor: Colors.black,
          ),
        ),
        const SizedBox(width: 16), // Add some space between the buttons
        Expanded(
          child: ActionButton(
            text: 'Continue',
            onPressed: onStepContinue,
            color: M3Color.of(context).primary,
            textColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
