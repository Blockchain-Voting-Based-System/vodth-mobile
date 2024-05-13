// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SampleModelCWProxy {
  SampleModel name(String? name);

  SampleModel description(String? description);

  SampleModel age(String? age);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SampleModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SampleModel(...).copyWith(id: 12, name: "My name")
  /// ````
  SampleModel call({
    String? name,
    String? description,
    String? age,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSampleModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSampleModel.copyWith.fieldName(...)`
class _$SampleModelCWProxyImpl implements _$SampleModelCWProxy {
  const _$SampleModelCWProxyImpl(this._value);

  final SampleModel _value;

  @override
  SampleModel name(String? name) => this(name: name);

  @override
  SampleModel description(String? description) =>
      this(description: description);

  @override
  SampleModel age(String? age) => this(age: age);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SampleModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SampleModel(...).copyWith(id: 12, name: "My name")
  /// ````
  SampleModel call({
    Object? name = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? age = const $CopyWithPlaceholder(),
  }) {
    return SampleModel(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      age: age == const $CopyWithPlaceholder()
          ? _value.age
          // ignore: cast_nullable_to_non_nullable
          : age as String?,
    );
  }
}

extension $SampleModelCopyWith on SampleModel {
  /// Returns a callable class that can be used as follows: `instanceOfSampleModel.copyWith(...)` or like so:`instanceOfSampleModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SampleModelCWProxy get copyWith => _$SampleModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SampleModel _$SampleModelFromJson(Map<String, dynamic> json) => SampleModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
      age: json['age'] as String?,
    );

Map<String, dynamic> _$SampleModelToJson(SampleModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'age': instance.age,
    };
