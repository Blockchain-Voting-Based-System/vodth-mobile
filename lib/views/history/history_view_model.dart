import 'package:vodth_mobile/core/base/base_view_model.dart';

class HistoryViewModel extends BaseViewModel {
  String _selectedChip = 'All';
  String get selectedChip => _selectedChip;

  void selectChip(String chip) {
    _selectedChip = chip;
    notifyListeners();
  }
}
