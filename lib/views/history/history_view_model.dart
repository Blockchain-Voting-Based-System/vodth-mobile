import 'dart:async';

import 'package:sui/sui.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';
import 'package:vodth_mobile/core/services/event_service.dart';

class HistoryViewModel extends BaseViewModel {
  List<EventModel>? get events => EventService.instance.historyEvents;

  int get eventCount => _eventCount;
  final int _eventCount = 0;
  SuiObjectResponse? _event;
  SuiObjectResponse? get event => _event;

  SuiObjectResponse? _candidate;
  SuiObjectResponse? get candidate => _candidate;

  HistoryViewModel() {
    getEvents();
  }

  Future<void> load() async {
    EventService.instance.fetchEventsAndSaveToLocalStorage();
    notifyListeners();
  }

  Future<void> getEvents() async {
    final client = SuiClient(SuiUrls.testnet);

    _event = await client.getObject('0x1defc88fc75dfd1efffe14a61e43633e9d93c1542b3536d2cd146da2085faf5a', options: SuiObjectDataOptions(showContent: true));

    notifyListeners();
  }
}
