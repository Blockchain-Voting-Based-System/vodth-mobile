import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:sui/sui.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';

class EventDetailViewModel extends BaseViewModel {
  final EventDetailRouteArgs params;

  EventDetailViewModel({required this.params}) {
    load();
  }

  List<CandidateModel>? candidates;

  EventModel? event;

  Future<void> load() async {
    await getEventDetail();
    await getCandidates();

    notifyListeners();
  }

  Future<void> getEventDetail() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('events').doc(params.id).get();
      event = EventModel.fromFirestore(snapshot);

      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print("Error getting event: $e");
      }
    }

    notifyListeners();
  }

  Future<void> getCandidates() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('candidates').where('eventId', isEqualTo: event?.id).get();
      candidates = snapshot.docs.map((e) => CandidateModel.fromFirestore(e)).toList();

      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print("Error getting events: $e");
      }
    }
    notifyListeners();
  }

  Map<String, double> candidateVotes = {
    'Candidate A': 8,
    'Candidate B': 3,
    'Candidate C': 4,
  };

  double get totalVotes {
    return candidateVotes.values.fold(0, (total, votes) => total + votes);
  }

  Future eventLiveVoteCount() async {
    final client = SuiClient(SuiUrls.testnet);

    SuiObjectResponse suiObjectResponse = await client.getObject(event?.suiEventId ?? '', options: SuiObjectDataOptions(showContent: true));

    print(suiObjectResponse.data?.content?.fields);

    return suiObjectResponse.data?.content?.fields['voted'];
  }
}
