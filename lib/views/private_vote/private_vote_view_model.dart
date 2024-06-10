import 'package:vodth_mobile/core/base/base_view_model.dart';

class PrivateVoteViewModel extends BaseViewModel {
  String _selectedChip = 'All';
  String get selectedChip => _selectedChip;

  int get eventCount => _eventCount;
  int _eventCount = 0;

  void selectChip(String chip) {
    _selectedChip = chip;
    notifyListeners();
  }

  void setEventCount(int count) {
    _eventCount = count;
    notifyListeners();
  }
}
