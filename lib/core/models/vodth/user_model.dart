import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vodth_mobile/core/models/base_model.dart';

part 'user_model.g.dart';

@CopyWith()
@JsonSerializable()
class UserModel extends BaseModel {
  final String? id;
  final String? email;

  UserModel({
    this.id,
    this.email,
  });

  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
