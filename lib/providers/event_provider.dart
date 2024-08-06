import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';
import 'package:vodth_mobile/core/services/event_service.dart';

class EventProvider extends ChangeNotifier {
  List<EventModel>? _events; // Private variable to store events

  List<EventModel>? get events => _events;

  EventProvider() {
    load();
  }

  void load() {
    EventService.instance.fetchEventsAndSaveToLocalStorage();
  }

  Future<void> fetchEventsByUser(BuildContext context) async {
    try {
      final events = await EventService.instance.fetchEventsByUser(context);

      _events = events;
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching events by user: $e");
      }
      _events = [];
      notifyListeners();
    }
  }
}
