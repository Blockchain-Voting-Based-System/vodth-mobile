import 'package:flutter/material.dart';
import 'package:vodth_mobile/constant/config_constant.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';
import 'package:vodth_mobile/views/casting_vote/casting_vote_view_model.dart';
import 'package:vodth_mobile/views/casting_vote/local_widgets/action_button.dart';
import 'package:vodth_mobile/views/casting_vote/local_widgets/id_card_type.dart';
import 'package:vodth_mobile/views/casting_vote/upload_id/upload_id_view.dart';

class StepperPublicIdentityContent extends StatelessWidget {
  const StepperPublicIdentityContent({
    super.key,
    required this.viewModel,
  });

  final CastingVoteViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return UploadIdView(
      cardType: 'student_id',
      castingVoteViewModel: viewModel,
    );
    return _buildBody(context); // this is ui is for choosing id card type
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        Divider(thickness: 2, color: M3Color.of(context).primary),
        const SizedBox(
          height: 50,
        ),
        _buildChooseCardType(context),
        ConfigConstant.sizedBoxH2,
        ConfigConstant.sizedBoxH2,
        ConfigConstant.sizedBoxH2,
        _buildCardOptions(context),
        const SizedBox(
          height: 150,
        ),
        actionCancelNext(viewModel.nextStep, context),
      ],
    );
  }

  Widget _buildChooseCardType(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Choose your card type',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildCardOptions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          IdCardTypeTile(
            title: 'Student ID Card',
            onTap: () {
              String cardType = 'student_id';
            },
          ),
          IdCardTypeTile(
            title: 'National ID Card',
            onTap: () {
              String cardType = 'national_id';
            },
          ),
        ],
      ),
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
