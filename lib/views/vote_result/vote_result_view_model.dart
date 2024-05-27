import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/models/vodth/bar_chart_model.dart';

class VoteResultViewModel extends BaseViewModel {
  final List<BarChartModel> votes = [
    BarChartModel(candidateName: 'Candidate 1', votes: 10),
    BarChartModel(candidateName: 'Candidate 2', votes: 50),
    BarChartModel(candidateName: 'Candidate 3', votes: 30),
  ];
}
