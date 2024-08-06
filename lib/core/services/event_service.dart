import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';
import 'package:vodth_mobile/core/storages/event_storage.dart';
import 'package:vodth_mobile/providers/user_provider.dart';
import 'package:vodth_mobile/views/widgets/app_scope.dart';

class EventService {
  EventService._();

  static final EventService instance = EventService._();

  List<EventModel>? get events => _events;
  List<EventModel>? _events;

  List<EventModel>? get activeEvents =>
      _events?.where((element) => element.isActive).toList();
  List<EventModel>? get historyEvents =>
      _events?.where((element) => !element.isActive).toList();

  EventStorage eventStorage = EventStorage();

  Future<void> loadEventsFromLocalStorage() async {
    _events = await eventStorage.readList();
  }

  Future<void> fetchEventsAndSaveToLocalStorage() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('events').get();

      _events = snapshot.docs.map((e) => EventModel.fromFirestore(e)).toList();

      eventStorage.writeList(_events);
    } catch (e) {
      if (kDebugMode) {
        print("Error getting events: $e");
      }
    }
  }

  Future<List<EventModel>> fetchEventsByUser(BuildContext context) async {
    try {
      final userId = Provider.of<UserProvider>(context, listen: false).user?.id;

      if (userId == null) {
        return [];
      }

      final eventsQuery = FirebaseFirestore.instance.collection('events');
      final eventsSnapshot = await eventsQuery.get();

      final events = eventsSnapshot.docs.map((doc) {
        final event = EventModel.fromFirestore(doc);
        return event;
      }).toList();

      // Filter events where the user has voted
      final filteredEvents = await Future.wait(events.map((event) async {
        final votesSnapshot = await FirebaseFirestore.instance
            .collection('events')
            .doc(event.id)
            .collection('votes')
            .where('userId', isEqualTo: userId)
            .get();

        if (votesSnapshot.docs.isNotEmpty) {
          return event;
        } else {
          return null;
        }
      }));

      return filteredEvents.whereType<EventModel>().toList();
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching events by user: $e");
      }
      return [];
    }
  }

  Future<void> clearEvents() async {
    _events = null;

    await eventStorage.readList();
  }
}
