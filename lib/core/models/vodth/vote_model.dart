import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vodth_mobile/core/models/base_model.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';
import 'package:vodth_mobile/core/models/vodth/user_model.dart';

part 'vote_model.g.dart';

@CopyWith()
@JsonSerializable()
class VoteModel extends BaseModel {
  final int? id;
  final UserModel? user;
  final EventModel? event;
  final CandidateModel? candidate;

  VoteModel({
    this.id,
    this.user,
    this.event,
    this.candidate,
  });

  @override
  Map<String, dynamic> toJson() => _$VoteModelToJson(this);
  factory VoteModel.fromJson(Map<String, dynamic> json) =>
      _$VoteModelFromJson(json);
}
