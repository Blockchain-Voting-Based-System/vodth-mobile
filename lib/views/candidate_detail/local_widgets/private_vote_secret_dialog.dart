// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
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
      title: Text(tr("title.secret_dialog"),
        style: M3TextTheme.of(context).titleLarge?.copyWith(
              color: M3Color.of(context).primary,
              fontWeight: FontWeight.bold,
            ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           Text(tr('message.enter_secret_key')),
          const SizedBox(height: 8.0),
          TextField(
            controller: controller,
            decoration:  InputDecoration(
              hintText: tr('placeholder.secret_key') ,
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFDADADA)),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child:  Text(tr('button.Cancel')),
          onPressed: () {
            context.router.popForced();
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
              child:  Text(
                tr('button.Vote'),
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                await MessengerService.of(context).showBlankLoading(
                  future: () async {
                    await viewModel.validateAndRemoveSecret(controller.text);
                  },
                  debugSource: "CandidateDetailViewModel#voteCandidate",
                );
                if (viewModel.validSecret) {
                  context.router.popForced();

                  MessengerService.of(context).showSnackBar(
                    tr('message.Vote_successfully'),
                    backgroundColor: M3Color.bootstrap(context).success.color,
                    foregroundColor: M3Color.bootstrap(context).success.onColor,
                  );
                } else {
                  MessengerService.of(context).showSnackBar(
                     tr('message.Vote_unsuccessfully'),
                    backgroundColor: M3Color.of(context).error,
                    foregroundColor: M3Color.of(context).onError,
                  );
                }
              }),
        ),
      ],
    );
  }
}
