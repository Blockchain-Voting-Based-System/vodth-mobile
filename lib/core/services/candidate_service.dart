import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';

class CandidateService {
  Future<List<CandidateModel>?> getCandidates({required String eventId}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('candidates').where('eventId', isEqualTo: eventId).get();
      List<CandidateModel>? candidates = snapshot.docs.map((e) => CandidateModel.fromFirestore(e)).toList();

      return candidates;
    } catch (e) {
      if (kDebugMode) {
        print("Error getting events: $e");
      }
    }

    return null;
  }
}
