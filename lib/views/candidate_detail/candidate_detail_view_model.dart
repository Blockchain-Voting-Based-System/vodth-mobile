import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

  CandidateModel? _candidate;
  CandidateModel? get candidate => _candidate;

  EventModel? _event;
  EventModel? get event => _event;

  Future<void> load() async {
    await getCandidateDetail();
    await getEventDetail();
    notifyListeners();
  }

  Future<void> getEventDetail() async {
    if (candidate?.eventId == null) {
      return;
    }

    try {
      DocumentSnapshot<Map<String, dynamic>> event = await FirebaseFirestore.instance.collection('events').doc(candidate!.eventId).get();

      _event = EventModel.fromFirestore(event);
    } catch (e) {
      if (kDebugMode) {
        print("Error getting event: $e");
      }
    }
  }

  Future<void> getCandidateDetail() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('candidates').doc(params.id).get();

      _candidate = CandidateModel.fromFirestore(snapshot);
    } catch (e) {
      if (kDebugMode) {
        print("Error getting candidate: $e");
      }
    }
  }

  Future<void> voteCandidate(BuildContext context) async {
    SignTransactionService signTxService = SignTransactionService();

    final tx = TransactionBlock();

    try {
      tx.moveCall(
        '${signTxService.packageObjectId}::vote::new_ballot',
        arguments: [tx.pure(candidate?.suiEventId), tx.pure(candidate?.suiCandidateId), tx.pure("vaneath from flutter 1")],
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

    notifyListeners();
  }

  Future<bool> validateAndRemoveSecret(String secret) async {
    final eventDocRef = FirebaseFirestore.instance.collection('events').doc(candidate?.eventId);

    return FirebaseFirestore.instance.runTransaction<bool>((transaction) async {
      DocumentSnapshot<Map<String, dynamic>> eventSnapshot = await transaction.get(eventDocRef);

      if (!eventSnapshot.exists) {
        print("Event not found");
        return false;
      }

      print("Secrets: ${eventSnapshot.data()}");

      List<dynamic> voterSecrets = eventSnapshot.data()?['voterSecrets'] ?? [];

      print("Secrets: $voterSecrets");
      if (!voterSecrets.contains(secret)) {
        print("Secret not found");
        return false;
      }

      // Remove the secret
      voterSecrets.remove(secret);

      // Update the document
      transaction.update(eventDocRef, {'voterSecrets': voterSecrets});
      return true;
    }).catchError((error) {
      print("Error removing secret: $error");
      return false;
    });
  }
}
