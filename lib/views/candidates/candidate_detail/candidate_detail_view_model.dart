import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sui/sui.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/core/services/messenger_service.dart';
import 'package:vodth_mobile/core/services/sign_transaction_service.dart';

class CandidateDetailViewModel extends BaseViewModel {
  final CandidateDetailRouteArgs params;

  CandidateDetailViewModel({required this.params});

  SignTransactionService signTx = SignTransactionService();

  CandidateModel? _candidate;
  CandidateModel? get candidate => _candidate;

  Future<void> getCandidateDetail() async {
    CollectionReference<Map<String, dynamic>> candidates = FirebaseFirestore.instance.collection('candidates');

    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await candidates.doc(params.id).get();

      _candidate = CandidateModel.fromFirestore(snapshot);
    } catch (e) {
      print("Error getting candidate: $e");
    }
  }

  Future<void> voteCandidate(BuildContext context) async {
    SignTransactionService signTxService = SignTransactionService();

    final tx = TransactionBlock();
    tx.moveCall(
      '${signTxService.packageObjectId}::vote::new_ballot',
      arguments: [tx.pure(candidate?.suiEventId), tx.pure(candidate?.suiCandidateId), tx.pure("vaneath from flutter 1")],
    );

    MessengerService.of(context).showLoading(
        future: () async {
          try {
            await signTxService.client.signAndExecuteTransactionBlock(
              signTxService.account,
              tx,
              responseOptions: SuiTransactionBlockResponseOptions(
                showEffects: true,
                showBalanceChanges: true,
                showInput: true,
                showObjectChanges: true,
              ),
              requestType: ExecuteTransaction.WaitForLocalExecution,
            );
          } catch (e) {
            print(e);
          }
        },
        debugSource: "CandidateDetailViewModel#voteCandidate");

    notifyListeners();
  }
}
