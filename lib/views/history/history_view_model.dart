import 'dart:async';

import 'package:sui/sui.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';

class HistoryViewModel extends BaseViewModel {
  String _selectedChip = 'All';
  String get selectedChip => _selectedChip;

  int get eventCount => _eventCount;
  final int _eventCount = 0;
  SuiObjectResponse? _event;
  SuiObjectResponse? get event => _event;

  SuiObjectResponse? _candidate;
  SuiObjectResponse? get candidate => _candidate;

  HistoryViewModel() {
    getEvents();
  }

  void selectChip(String chip) {
    _selectedChip = chip;
    notifyListeners();
  }

  Future<void> getEvents() async {
    final client = SuiClient(SuiUrls.testnet);

    _event = await client.getObject('0x1defc88fc75dfd1efffe14a61e43633e9d93c1542b3536d2cd146da2085faf5a', options: SuiObjectDataOptions(showContent: true));

    notifyListeners();
  }

  Stream<String?> getStreamCandidate() async* {
    final client = SuiClient(SuiUrls.testnet);

    _candidate = await client.getObject('0x73a9e9739133a24ecbd84f0d9080ba194d9630790dbd81d0a12a81f747b9ce24', options: SuiObjectDataOptions(showContent: true));

    yield _candidate?.data?.content?.fields?.toString();
  }
}
