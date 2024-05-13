import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vodth_mobile/core/models/base_model.dart';

part 'sample_model.g.dart';

@CopyWith()
@JsonSerializable()
class SampleModel extends BaseModel {
  String? name;
  String? description;
  String? age;
  

  SampleModel({
    this.name,
    this.description,
    this.age,
  });

  @override
  Map<String, dynamic> toJson() => _$SampleModelToJson(this);
  factory SampleModel.fromJson(Map<String, dynamic> json) =>
      _$SampleModelFromJson(json);
}
