import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';
import 'package:vodth_mobile/core/services/event_service.dart';

class HistoryViewModel extends BaseViewModel {
  List<EventModel>? get events => _events;
  List<EventModel>? _events;

  HistoryViewModel(BuildContext context) {
    load(context);
  }

  Future<void> load(BuildContext context) async {
    _events = await EventService.instance.fetchEventsByUser(context);
    notifyListeners();
  }
}
