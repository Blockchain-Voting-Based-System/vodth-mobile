import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/services/event_service.dart';

class HomeViewModel extends BaseViewModel {
  String _selectedChip = 'All';
  String get selectedChip => _selectedChip;

  void selectChip(String chip) {
    _selectedChip = chip;
    notifyListeners();
  }

  HomeViewModel() {
    load();
  }

  Future<void> load() async {
    EventService.instance.loadEventsFromLocalStorage();
    notifyListeners();
  }

  Future<void> clearLocalEventsAndFetch() async {
    await EventService.instance.clearEvents();
    await EventService.instance.fetchEventsAndSaveToLocalStorage();
    notifyListeners();
  }
}
