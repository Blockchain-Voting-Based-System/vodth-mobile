import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vodth_mobile/core/models/base_model.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';

part 'event_model.g.dart';

@CopyWith()
@JsonSerializable()
class EventModel extends BaseModel {
  final String? id;
  final String? name;
  final String? description;
  final String? startDate;
  final String? endDate;
  final String? eventId;
  final String? imageName;
  final String? imageUrl;
  final String? type;
  final List<CandidateModel>? candidates;

  EventModel({
    this.id,
    this.name,
    this.description,
    this.eventId,
    this.startDate,
    this.endDate,
    this.type,
    this.imageName,
    this.imageUrl,
    this.candidates,
  });

  @override
  Map<String, dynamic> toJson() => _$EventModelToJson(this);
  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  factory EventModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return EventModel(
      id: doc.reference.id,
      name: data['name'],
      description: data['description'],
      eventId: data['eventId'],
      startDate: data['startDate'],
      endDate: data['endDate'],
      type: data['type'],
      imageName: data['imageName'],
      imageUrl: data['imageUrl'],
      candidates: (data['candidates'] as List?)
          ?.map((e) => CandidateModel.fromJson(e))
          .toList(),
    );
  }
}
