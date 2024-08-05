import 'package:vodth_mobile/core/base/base_view_model.dart';

class CastingVoteViewModel extends BaseViewModel {
  int currentStep = 0;

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
    // You can add more actions here, such as updating data or triggering an event
  }
}
