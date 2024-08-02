import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vodth_mobile/core/models/base_model.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';

part 'candidate_model.g.dart';

@CopyWith()
@JsonSerializable()
class CandidateModel extends BaseModel {
  final String? id;
  final String? birthday;
  final String? suiCandidateId;
  final String? suiEventId;
  final String? eventId;
  final String? imageUrl;
  final String? name;
  final String? sex;
  final String? status;
  final String? bio;
  final String? voteCount;
  final EventModel? event;

  CandidateModel({
    this.sex,
    this.bio,
    this.status,
    this.id,
    this.name,
    this.birthday,
    this.suiCandidateId,
    this.suiEventId,
    this.eventId,
    this.imageUrl,
    this.voteCount,
    this.event,
  });

  @override
  Map<String, dynamic> toJson() => _$CandidateModelToJson(this);
  factory CandidateModel.fromJson(Map<String, dynamic> json) => _$CandidateModelFromJson(json);

  factory CandidateModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return CandidateModel(
      id: doc.reference.id,
      name: data['name'],
      birthday: data['birthday'],
      suiCandidateId: data['suiCandidateId'],
      suiEventId: data['suiEventId'],
      eventId: data['eventId'],
      imageUrl: data['imageUrl'],
      sex: data['sex'],
      status: data['status'],
      bio: data['bio'],
      event: data['event'] != null ? EventModel.fromJson(data['event']) : null,
    );
  }
}
