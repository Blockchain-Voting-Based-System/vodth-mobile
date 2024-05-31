// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'id_card_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$IdCardModelCWProxy {
  IdCardModel result(int result);

  IdCardModel message(String message);

  IdCardModel data(List<String> data);

  IdCardModel url(String url);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `IdCardModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// IdCardModel(...).copyWith(id: 12, name: "My name")
  /// ````
  IdCardModel call({
    int? result,
    String? message,
    List<String>? data,
    String? url,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfIdCardModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfIdCardModel.copyWith.fieldName(...)`
class _$IdCardModelCWProxyImpl implements _$IdCardModelCWProxy {
  const _$IdCardModelCWProxyImpl(this._value);

  final IdCardModel _value;

  @override
  IdCardModel result(int result) => this(result: result);

  @override
  IdCardModel message(String message) => this(message: message);

  @override
  IdCardModel data(List<String> data) => this(data: data);

  @override
  IdCardModel url(String url) => this(url: url);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `IdCardModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// IdCardModel(...).copyWith(id: 12, name: "My name")
  /// ````
  IdCardModel call({
    Object? result = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
  }) {
    return IdCardModel(
      result: result == const $CopyWithPlaceholder() || result == null
          ? _value.result
          // ignore: cast_nullable_to_non_nullable
          : result as int,
      message: message == const $CopyWithPlaceholder() || message == null
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
      data: data == const $CopyWithPlaceholder() || data == null
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<String>,
      url: url == const $CopyWithPlaceholder() || url == null
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String,
    );
  }
}

extension $IdCardModelCopyWith on IdCardModel {
  /// Returns a callable class that can be used as follows: `instanceOfIdCardModel.copyWith(...)` or like so:`instanceOfIdCardModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$IdCardModelCWProxy get copyWith => _$IdCardModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdCardModel _$IdCardModelFromJson(Map<String, dynamic> json) => IdCardModel(
      result: (json['result'] as num).toInt(),
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>).map((e) => e as String).toList(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$IdCardModelToJson(IdCardModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'data': instance.data,
      'url': instance.url,
    };
