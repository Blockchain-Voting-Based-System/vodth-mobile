import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:sui/sui.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/core/services/sign_transaction_service.dart';

class CandidateDetailViewModel extends BaseViewModel {
  final CandidateDetailRouteArgs params;

  CandidateDetailViewModel({required this.params}) {
    load();
  }

  SignTransactionService signTx = SignTransactionService();

  CandidateModel? candidate;
  EventModel? event;

  bool validSecret = false;

  Future<void> load() async {
    getCandidateDetail();
    getEventDetail();
  }

  Future<void> getEventDetail() async {
    if (candidate?.eventId == null) {
      return;
    }

    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('events').doc(candidate!.eventId).get();
      event = EventModel.fromFirestore(snapshot);
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print("Error getting event: $e");
      }
    }
  }

  Future<void> getCandidateDetail() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('candidates').doc(params.id).get();
      candidate = CandidateModel.fromFirestore(snapshot);
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print("Error getting candidate: $e");
      }
    }
  }

  Future<void> voteCandidate() async {
    SignTransactionService signTxService = SignTransactionService();

    final tx = TransactionBlock();

    try {
      tx.moveCall(
        '${signTxService.packageObjectId}::vote::new_ballot',
        arguments: [
          tx.pure(candidate?.suiEventId),
          tx.pure(candidate?.suiCandidateId),
          tx.pureString('vaneath flutter hash'),
          tx.pureString(candidate?.name ?? ''),
        ],
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

      // Notify listeners only if the vote is successful
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      // Re-throw the error to handle it in the caller function
      rethrow;
    }
  }

  Future<void> validateAndRemoveSecret(String secret) async {
    final eventDocRef = FirebaseFirestore.instance.collection('events').doc(candidate?.eventId);

    try {
      await FirebaseFirestore.instance.runTransaction<void>((transaction) async {
        DocumentSnapshot<Map<String, dynamic>> eventSnapshot = await transaction.get(eventDocRef);
        List<dynamic> voterSecrets = eventSnapshot.data()?['voterSecrets'] ?? [];

        if (voterSecrets.isEmpty || !voterSecrets.contains(secret)) {
          validSecret = false;
          return;
        }

        try {
          await voteCandidate(); // Attempt to vote

          // Remove the secret only if the vote is successful
          voterSecrets.remove(secret);

          // Update the document
          transaction.update(eventDocRef, {'voterSecrets': voterSecrets});

          validSecret = true;
        } catch (e) {
          if (kDebugMode) {
            print("vaneath $e");
          }
          validSecret = false;
        }
      });
    } catch (error) {
      validSecret = false;
      if (kDebugMode) {
        print(error);
      }
    } finally {
      notifyListeners();
    }
  }
}
