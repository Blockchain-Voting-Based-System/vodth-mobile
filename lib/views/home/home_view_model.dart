import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';

class HomeViewModel extends BaseViewModel {
  final List<EventModel> events = [
    EventModel(
      id: 1,
      title: 'JCI Present Election',
      description: 'Representative of the Kungfu panda club',
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
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg3JEBrivo1oZRbeKNoiqhGLz2x5QmdLYXqjNRObkTEw&s',
      candidates: [],
    ),
    EventModel(
      id: 2,
      title: 'CADT Student Embassador Election',
      description: 'BookMeBus is a bus ticket booking platform',
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      activate: true,
      bannerUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg3JEBrivo1oZRbeKNoiqhGLz2x5QmdLYXqjNRObkTEw&s',
      candidates: [],
    ),
  ];
}
