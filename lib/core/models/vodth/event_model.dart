import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vodth_mobile/core/models/base_model.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';

part 'event_model.g.dart';

@CopyWith()
@JsonSerializable()
class EventModel extends BaseModel {
  @JsonKey(readValue: toInt)
  final int? id;
  final String? title;
  final String? description;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool? activate;
  final String? bannerUrl;
  final List<CandidateModel>? candidates;

  EventModel({
    this.id,
    this.title,
    this.description,
    this.startDate,
    this.endDate,
    this.activate,
    this.bannerUrl,
    this.candidates,
  });

  @override
  Map<String, dynamic> toJson() => _$EventModelToJson(this);
  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
}
