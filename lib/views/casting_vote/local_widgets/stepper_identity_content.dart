// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vodth_mobile/core/services/messenger_service.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';
import 'package:vodth_mobile/providers/voting_provider.dart';
import 'package:vodth_mobile/views/casting_vote/casting_vote_view_model.dart';
import 'package:vodth_mobile/views/casting_vote/local_widgets/check_your_email_icon.dart';
import 'package:vodth_mobile/views/widgets/vm_bottom.dart';

class StepperIdentityContent extends StatelessWidget {
  const StepperIdentityContent({
    super.key,
    required this.viewModel,
  });
  final CastingVoteViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Column(
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
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Please enter your secret key that was sent to your email to join the voting event:'),
            const SizedBox(height: 8.0),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Secret Key",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFDADADA)),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24.0),
        _buildVerifySecretButton(context, controller),
      ],
    );
  }

  VmButton _buildVerifySecretButton(BuildContext context, TextEditingController controller) {
    return VmButton.filled(
      label: 'Verify',
      onPressed: () async {
        VotingProvider votingProvider = context.read<VotingProvider>();

        await MessengerService.of(context).showBlankLoading(
          future: () async {
            await votingProvider.validateSecret(
              secret: controller.text,
              eventId: viewModel.event.id ?? '',
            );
          },
          debugSource: 'StepperIdentityContent',
        );

        if (votingProvider.validSecret) {
          MessengerService.of(context).showSnackBar(
            'Secret key is valid',
            backgroundColor: M3Color.bootstrap(context).success.color,
            foregroundColor: M3Color.bootstrap(context).success.onColor,
          );
        } else {
          MessengerService.of(context).showSnackBar(
            'Secret key is invalid',
            backgroundColor: M3Color.of(context).error,
            foregroundColor: M3Color.of(context).onError,
          );
        }
      },
      size: VmButtonSize.medium,
      width: double.infinity,
    );
  }
}
