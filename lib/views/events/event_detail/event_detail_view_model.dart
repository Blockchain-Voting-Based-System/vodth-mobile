import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';

class EventDetailViewModel extends BaseViewModel {
  final EventDetailRouteArgs params;

  EventDetailViewModel({required this.params});
  List<CandidateModel>? candidates;

  Future<void> getCandidatesList() async {
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection('candidates')
          .where('eventId', isEqualTo: params.id)
          .get();

      candidates =
          snapshot.docs.map((e) => CandidateModel.fromFirestore(e)).toList();
    } catch (e) {
      print("Error getting events: $e");
    }
  }
}
