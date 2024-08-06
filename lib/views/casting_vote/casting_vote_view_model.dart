import 'package:flutter/foundation.dart';
import 'package:sui/sui.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';
import 'package:vodth_mobile/core/services/sign_transaction_service.dart';

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

  Future<void> voteCandidate() async {
    SignTransactionService signTxService = SignTransactionService();

    final tx = TransactionBlock();

    try {
      tx.moveCall(
        '${signTxService.packageObjectId}::vote::new_ballot',
        arguments: [
          tx.pure(selectedCandidate?.suiEventId),
          tx.pure(selectedCandidate?.suiCandidateId),
          tx.pureString('vaneath flutter hash'),
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
}
