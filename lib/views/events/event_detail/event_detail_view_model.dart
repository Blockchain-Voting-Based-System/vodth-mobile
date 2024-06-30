import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';

class EventDetailViewModel extends BaseViewModel {
  final EventDetailRouteArgs params;

  EventDetailViewModel({required this.params});

  List<CandidateModel>? _candidates;
  List<CandidateModel>? get candidates => _candidates;

  EventModel? _event;
  EventModel? get event => _event;

  Future<void> getEventDetail() async {
    CollectionReference<Map<String, dynamic>> events = FirebaseFirestore.instance.collection('events');

    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await events.doc(params.id).get();

      _event = EventModel.fromFirestore(snapshot);
    } catch (e) {
      print("Error getting event: $e");
    }
  }

  Future<void> getCandidatesList() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('candidates').where('eventId', isEqualTo: params.id).get();

      _candidates = snapshot.docs.map((e) => CandidateModel.fromFirestore(e)).toList();
    } catch (e) {
      print("Error getting events: $e");
    }
  }
}
