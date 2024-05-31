import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vodth_mobile/core/models/base_model.dart';

part 'id_card_model.g.dart';

@CopyWith()
@JsonSerializable()
class IdCardModel extends BaseModel {
  final int result;
  final String message;
  final List<String> data;
  final String url;

  IdCardModel({
    required this.result,
    required this.message,
    required this.data,
    required this.url,
  });

  @override
  Map<String, dynamic> toJson() => _$IdCardModelToJson(this);
  factory IdCardModel.fromJson(Map<String, dynamic> json) =>
      _$IdCardModelFromJson(json);
}
