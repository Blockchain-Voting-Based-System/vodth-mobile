import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';

class CastingVoteViewModel extends BaseViewModel {
  CastingVoteViewModel({required this.candidates});

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
}
