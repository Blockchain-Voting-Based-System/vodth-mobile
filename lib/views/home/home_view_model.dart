import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:sui/sui.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';
import 'package:vodth_mobile/core/services/event_service.dart';

class HomeViewModel extends BaseViewModel {
  String _selectedChip = 'All';
  String get selectedChip => _selectedChip;

  void selectChip(String chip) {
    _selectedChip = chip;
    notifyListeners();
  }

  List<SuiObjectResponse>? get ownedObject => _ownedObject?.data;
  PaginatedObjectsResponse? _ownedObject;

  List<EventModel>? eventsList;

  Future<void> getEventsList() async {
    try {
      var snapshot = await FirebaseFirestore.instance.collection('events').get();

      eventsList = snapshot.docs.map((e) => EventModel.fromFirestore(e)).toList();
    } catch (e) {
      if (kDebugMode) {
        print("Error getting events: $e");
      }
    }
  }

  int? get balance => _balance?.coinObjectCount;
  CoinBalance? _balance;

  HomeViewModel() {
    load();
  }

  Future<void> load() async {
    EventService.instance.loadEventsFromLocalStorage();
    notifyListeners();
  }
}
