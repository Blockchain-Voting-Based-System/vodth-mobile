import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';

class CastingVoteViewModel extends BaseViewModel {
  CastingVoteViewModel({required this.event}) {
    load();
  }

  Future<void> load() async {
    loadCandidates();
  }

  int currentStep = 0;
  EventModel event;
  String? selectedCandidate;
  bool isFinished = false;

  List<CandidateModel>? candidates;

  Future<void> loadCandidates() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('candidates').where('eventId', isEqualTo: event.id).get();
      candidates = snapshot.docs.map((e) => CandidateModel.fromFirestore(e)).toList();

      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print("Error getting events: $e");
      }
    }
    notifyListeners();
  }

  void nextStep() {
    if (currentStep < 1) {
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

  void setIsFinished(bool value) {
    isFinished = value;
    notifyListeners();
  }

  void resetIsFinished() {
    isFinished = false;
    notifyListeners();
  }
}
