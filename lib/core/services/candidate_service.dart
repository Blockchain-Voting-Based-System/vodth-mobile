import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sui/builder/transaction_block.dart';
import 'package:sui/types/transactions.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';
import 'package:vodth_mobile/core/services/sign_transaction_service.dart';

class CandidateService {
  Future<void> voteCandidate({
    required BuildContext context,
    required CandidateModel candidate,
  }) async {
    SignTransactionService signTxService = SignTransactionService();

    final tx = TransactionBlock();

    try {
      tx.moveCall(
        '${signTxService.packageObjectId}::vote::new_ballot',
        arguments: [tx.pure(candidate.suiEventId), tx.pure(candidate.suiCandidateId), tx.pure("vaneath from flutter 1")],
      );

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
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<bool> validateAndRemoveSecret({required CandidateModel candidate, required String secret}) async {
    final eventDocRef = FirebaseFirestore.instance.collection('events').doc(candidate.eventId);

    return FirebaseFirestore.instance.runTransaction<bool>((transaction) async {
      DocumentSnapshot<Map<String, dynamic>> eventSnapshot = await transaction.get(eventDocRef);

      if (!eventSnapshot.exists) {
        return false;
      }

      List<dynamic> voterSecrets = eventSnapshot.data()?['voterSecrets'] ?? [];

      if (!voterSecrets.contains(secret)) {
        return false;
      }

      // Remove the secret
      voterSecrets.remove(secret);

      // Update the document
      transaction.update(eventDocRef, {'voterSecrets': voterSecrets});
      return true;
    }).catchError((error) {
      return false;
    });
  }
}
