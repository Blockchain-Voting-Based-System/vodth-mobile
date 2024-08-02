import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';
import 'package:vodth_mobile/core/services/event_service.dart';

class HistoryViewModel extends BaseViewModel {
  List<EventModel>? get events => EventService.instance.historyEvents;

  HistoryViewModel() {
    load();
  }

  Future<void> load() async {
    EventService.instance.fetchEventsAndSaveToLocalStorage();
    notifyListeners();
  }
}
