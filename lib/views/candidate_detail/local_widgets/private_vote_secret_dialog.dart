import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/services/messenger_service.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';
import 'package:vodth_mobile/core/theme/m3/m3_text_theme.dart';
import 'package:vodth_mobile/views/candidate_detail/candidate_detail_view_model.dart';

class PrivateVoteSecretDialog extends StatelessWidget {
  const PrivateVoteSecretDialog({
    super.key,
    required this.controller,
    required this.viewModel,
  });

  final TextEditingController controller;
  final CandidateDetailViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Private Vote Secret Key',
        style: M3TextTheme.of(context).titleLarge?.copyWith(
              color: M3Color.of(context).primary,
              fontWeight: FontWeight.bold,
            ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Please enter your secret key to join the voting event:'),
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
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Container(
          decoration: BoxDecoration(
            color: M3Color.of(context).primary,
            borderRadius: BorderRadius.circular(10.0),
          ),
          width: 100,
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: TextButton(
              child: const Text(
                'Vote',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                bool isValid = false;
                MessengerService.of(context).showBlankLoading(
                  future: () async {
                    isValid = await viewModel.validateAndRemoveSecret(controller.text);
                  },
                  debugSource: "CandidateDetailViewModel#voteCandidate",
                );

                if (isValid) {
                  viewModel.voteCandidate(context);

                  MessengerService.of(context).showSnackBar(
                    'Vote successfully',
                  );
                } else {
                  MessengerService.of(context).showSnackBar(
                    'Invalid secret key',
                    success: false,
                  );
                }
              }),
        ),
      ],
    );
  }
}
