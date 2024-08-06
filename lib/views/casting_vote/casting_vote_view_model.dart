import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sui/sui.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';
import 'package:vodth_mobile/core/models/vodth/user_model.dart';
import 'package:vodth_mobile/core/services/messenger_service.dart';
import 'package:vodth_mobile/core/services/sign_transaction_service.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';
import 'package:vodth_mobile/providers/user_provider.dart';

class CastingVoteViewModel extends BaseViewModel {
  CastingVoteViewModel({
    required this.candidates,
    required this.event,
  });

  int currentStep = 0;
  List<CandidateModel>? candidates;
  EventModel? event;
  CandidateModel? selectedCandidate;
  bool isFinished = false;

  void nextStep() {
    if (currentStep < 2) {
      currentStep++;
      notifyListeners();
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      currentStep--;
      notifyListeners();
    }
  }

  void onStepChanged(int index) {
    // Handle any additional logic when the step changes
    currentStep = index;
    // You can
    // add more actions here, such as updating data or triggering an event
  }

  void goToStep(int index) {
    currentStep = index;
    notifyListeners();
  }

  void selectCandidate(CandidateModel? candidate) {
    selectedCandidate = candidate;
    notifyListeners();
  }

  void setIsFinished(bool value) {
    isFinished = value;
    notifyListeners();
  }

  void resetIsFinished() {
    isFinished = false;
    notifyListeners();
  }

  Future<void> checkEligibleVoter(String userId, BuildContext context) async {
    final votesCollection = FirebaseFirestore.instance.collection('events').doc(event?.id).collection('votes');

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await votesCollection.where('userId', isEqualTo: userId).get();

    if (querySnapshot.docs.isNotEmpty) {
      MessengerService.of(context).showSnackBar(
        'User has already voted for this event.',
        backgroundColor: M3Color.of(context).error,
        foregroundColor: M3Color.of(context).onError,
      );
      throw Exception('User has already voted for this event.');
    }
  }

  Future<void> voteCandidate(BuildContext context) async {
    final votesCollection = FirebaseFirestore.instance.collection('events').doc(event?.id).collection('votes');
    SignTransactionService signTxService = SignTransactionService();
    UserModel? user = context.read<UserProvider>().user;
    final tx = TransactionBlock();

    try {
      // Check if the user is eligible to vote
      await checkEligibleVoter(user?.id ?? '', context);

      // Proceed with the voting process if the user is eligible
      tx.moveCall(
        '${signTxService.packageObjectId}::vote::new_ballot',
        arguments: [
          tx.pure(selectedCandidate?.suiEventId),
          tx.pure(selectedCandidate?.suiCandidateId),
          tx.pureString(user?.id ?? ''),
          tx.pureString(selectedCandidate?.name ?? ''),
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

      await votesCollection.add({
        'eventId': selectedCandidate?.suiEventId,
        'userId': user?.id,
        'voteTime': Timestamp.now(),
      });

      isFinished = true;

      // Notify listeners only if the vote is successful
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      isFinished = true;
      notifyListeners();
    }
  }
}
