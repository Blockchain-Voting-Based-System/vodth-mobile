import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:sui/sui.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';
import 'package:vodth_mobile/core/services/sign_transaction_service.dart';

class VotingProvider extends BaseViewModel {
  bool validSecret = false;
  String? selectedCandidate;

  Future<void> voteCandidate(CandidateModel candidate) async {
    SignTransactionService signTxService = SignTransactionService();

    final tx = TransactionBlock();

    try {
      tx.moveCall(
        '${signTxService.packageObjectId}::vote::new_ballot',
        arguments: [tx.pure(candidate.suiEventId), tx.pure(candidate.suiCandidateId), tx.pure("vaneath from flutter 1"), tx.pure('candidate_name')],
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

      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      rethrow;
    }
  }

  Future<void> validateSecret({
    required String eventId,
    required String secret,
  }) async {
    final eventDocRef = FirebaseFirestore.instance.collection('events').doc(eventId);

    try {
      DocumentSnapshot<Map<String, dynamic>> eventSnapshot = await eventDocRef.get();
      List<dynamic> voterSecrets = eventSnapshot.data()?['voterSecrets'] ?? [];

      if (voterSecrets.isEmpty || !voterSecrets.contains(secret)) {
        validSecret = false;
        notifyListeners();
        return;
      }

      validSecret = true;
      notifyListeners();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      validSecret = false;
      notifyListeners();
    }

    notifyListeners();
  }

  Future<void> removeSecret({
    required CandidateModel candidate,
    required String secret,
  }) async {
    final eventDocRef = FirebaseFirestore.instance.collection('events').doc(candidate.eventId);

    await FirebaseFirestore.instance.runTransaction<void>((transaction) async {
      DocumentSnapshot<Map<String, dynamic>> eventSnapshot = await transaction.get(eventDocRef);
      List<dynamic> voterSecrets = eventSnapshot.data()?['voterSecrets'] ?? [];

      voterSecrets.remove(secret);

      // Update the document
      transaction.update(eventDocRef, {'voterSecrets': voterSecrets});
    });

    notifyListeners();
  }

  Future<void> validateAndRemoveSecret({
    required CandidateModel candidate,
    required String secret,
  }) async {
    try {
      await validateSecret(eventId: candidate.eventId ?? '', secret: secret);

      if (!validSecret) {
        return;
      }

      await voteCandidate(candidate); // Attempt to vote

      // Remove the secret only if the vote is successful
      await removeSecret(candidate: candidate, secret: secret);

      validSecret = true;
    } catch (e) {
      validSecret = false;
    } finally {
      notifyListeners();
    }
  }

  void selectCandidate(String? candidate) {
    print('vaneath candidate: $candidate');
    if (selectedCandidate == candidate) {
      selectedCandidate = null;
      notifyListeners();
      return;
    }

    selectedCandidate = candidate;
    notifyListeners();
  }
}
