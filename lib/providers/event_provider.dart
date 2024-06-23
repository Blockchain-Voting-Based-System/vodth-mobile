import 'package:flutter/foundation.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';
import 'package:vodth_mobile/core/services/event_service.dart';

class EventProvider extends ChangeNotifier {
  List<EventModel>? get events => EventService.instance.events;

  EventProvider() {
    load();
  }

  void load() {
    EventService.instance.fetchEventsAndSaveToLocalStorage();
  }
}
