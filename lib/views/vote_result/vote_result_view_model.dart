import 'package:vodth_mobile/core/base/base_view_model.dart';

class VoteResultViewModel extends BaseViewModel {
  Map<String, double> candidateVotes = {
    'Candidate A': 8,
    'Candidate B': 3,
    'Candidate C': 4,
  };

  double get totalVotes {
    return candidateVotes.values.fold(0, (sum, votes) => sum + votes);
  }
}
