import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';

class CandidateViewModel extends BaseViewModel {
  final CandidateModel? candidate;

  CandidateViewModel({
    required this.candidate,
  });
}
