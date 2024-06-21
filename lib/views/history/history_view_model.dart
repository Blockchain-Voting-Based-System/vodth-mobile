import 'dart:async';

import 'package:sui/sui.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';

class HistoryViewModel extends BaseViewModel {
  String _selectedChip = 'All';
  String get selectedChip => _selectedChip;

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

  final List<EventModel> events = [
    EventModel(
      id: 1,
      title: 'JCI Present Election',
      description:
          'Representative of the Kungfu panda club. lorem ipsum dolor sit amet consectur adispicing elit lorem ipsum dolor sit amet consectur adispicing elit',
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      activate: true,
      bannerUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg3JEBrivo1oZRbeKNoiqhGLz2x5QmdLYXqjNRObkTEw&s',
      candidates: [],
    ),
    EventModel(
      id: 2,
      title: 'BookMeBus Senior Voting Event',
      description: 'BookMeBus is a bus ticket booking platform',
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      activate: true,
      bannerUrl:
          'https://play-lh.googleusercontent.com/_h_HSmLskHxLcGbPRo47Pno6E-e9W3ViDHs2E-crsWl-JflPrh7UEozzPPVWCO981IE',
      candidates: [],
    ),
    EventModel(
      id: 2,
      title: 'CADT Student Embassador Election',
      description: 'BookMeBus is a bus ticket booking platform',
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      activate: true,
      bannerUrl: 'https://avatars.githubusercontent.com/u/109834020?v=4',
      candidates: [],
    ),
  ];

  Future<void> getEvents() async {
    final client = SuiClient(SuiUrls.devnet);

    _event = await client.getObject(
        '0x1defc88fc75dfd1efffe14a61e43633e9d93c1542b3536d2cd146da2085faf5a',
        options: SuiObjectDataOptions(showContent: true));

    notifyListeners();
  }

  Stream<String?> getStreamCandidate() async* {
    final client = SuiClient(SuiUrls.devnet);

    _candidate = await client.getObject(
        '0x73a9e9739133a24ecbd84f0d9080ba194d9630790dbd81d0a12a81f747b9ce24',
        options: SuiObjectDataOptions(showContent: true));

    yield _candidate?.data?.content?.fields?.toString();
  }
}
