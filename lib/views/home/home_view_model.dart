import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';
import 'package:vodth_mobile/core/services/event_service.dart';

class HomeViewModel extends BaseViewModel {
  String _selectedChip = 'All';
  String get selectedChip => _selectedChip;
  List<EventModel> events = EventService.instance.activeEvents ?? [];

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

  void filterEvents(String label) {
    if (EventService.instance.events == null) {
      return;
    }

    if (label == 'All') {
      events = EventService.instance.activeEvents!;
    } else if (label == 'Public') {
      events = EventService.instance.activeEvents!.where((element) => element.isPublic).toList();
    } else if (label == 'Private') {
      events = EventService.instance.activeEvents!.where((element) => element.isPrivate).toList();
    }
    notifyListeners();
  }
}
