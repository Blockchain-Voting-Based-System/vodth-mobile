import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vodth_mobile/core/models/base_model.dart';

part 'bar_chart_model.g.dart';

@CopyWith()
@JsonSerializable()
class BarChartModel extends BaseModel {
  final String? candidateName;
  final int? votes;

  BarChartModel({
    this.candidateName,
    this.votes,
  });

  @override
  Map<String, dynamic> toJson() => _$BarChartModelToJson(this);
  factory BarChartModel.fromJson(Map<String, dynamic> json) =>
      _$BarChartModelFromJson(json);
}
