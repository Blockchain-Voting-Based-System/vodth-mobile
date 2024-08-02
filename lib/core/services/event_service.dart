import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';
import 'package:vodth_mobile/core/storages/event_storage.dart';

class EventService {
  EventService._();

  static final EventService instance = EventService._();

  List<EventModel>? get events => _events;
  List<EventModel>? _events;

  List<EventModel>? get activeEvents => _events?.where((element) => element.isActive).toList();
  List<EventModel>? get historyEvents => _events?.where((element) => !element.isActive).toList();

  EventStorage eventStorage = EventStorage();

  Future<void> loadEventsFromLocalStorage() async {
    _events = await eventStorage.readList();
  }

  Future<void> fetchEventsAndSaveToLocalStorage() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('events').get();

      _events = snapshot.docs.map((e) => EventModel.fromFirestore(e)).toList();

      eventStorage.writeList(_events);
    } catch (e) {
      if (kDebugMode) {
        print("Error getting events: $e");
      }
    }
  }

  Future<void> clearEvents() async {
    _events = null;

    await eventStorage.readList();
  }
}
