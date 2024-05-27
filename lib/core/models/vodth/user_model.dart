import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vodth_mobile/core/models/base_model.dart';
import 'package:vodth_mobile/core/models/vodth/vote_model.dart';

part 'user_model.g.dart';

@CopyWith()
@JsonSerializable()
class UserModel extends BaseModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final VoteModel? vote;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.vote,
  });

  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
