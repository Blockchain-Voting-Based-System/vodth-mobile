import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';

class HistoryViewModel extends BaseViewModel {
  String _selectedChip = 'All';
  String get selectedChip => _selectedChip;

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
}
