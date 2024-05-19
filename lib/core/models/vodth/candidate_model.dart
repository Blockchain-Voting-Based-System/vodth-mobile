import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vodth_mobile/core/models/base_model.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';

part 'candidate_model.g.dart';

@CopyWith()
@JsonSerializable()
class CandidateModel extends BaseModel {
  @JsonKey(readValue: toInt)
  final int? id;
  final String? name;
  final String? info;
  final String? avartarUrl;
  final EventModel? event;

  CandidateModel({
    this.id,
    this.name,
    this.info,
    this.avartarUrl,
    this.event,
  });

  @override
  Map<String, dynamic> toJson() => _$CandidateModelToJson(this);
  factory CandidateModel.fromJson(Map<String, dynamic> json) =>
      _$CandidateModelFromJson(json);
}
