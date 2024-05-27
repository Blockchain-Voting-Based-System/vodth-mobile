// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CandidateModelCWProxy {
  CandidateModel id(int? id);

  CandidateModel name(String? name);

  CandidateModel info(String? info);

  CandidateModel event(EventModel? event);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CandidateModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CandidateModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CandidateModel call({
    int? id,
    String? name,
    String? info,
    EventModel? event,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCandidateModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCandidateModel.copyWith.fieldName(...)`
class _$CandidateModelCWProxyImpl implements _$CandidateModelCWProxy {
  const _$CandidateModelCWProxyImpl(this._value);

  final CandidateModel _value;

  @override
  CandidateModel id(int? id) => this(id: id);

  @override
  CandidateModel name(String? name) => this(name: name);

  @override
  CandidateModel info(String? info) => this(info: info);

  @override
  CandidateModel event(EventModel? event) => this(event: event);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CandidateModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CandidateModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CandidateModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? info = const $CopyWithPlaceholder(),
    Object? event = const $CopyWithPlaceholder(),
  }) {
    return CandidateModel(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      info: info == const $CopyWithPlaceholder()
          ? _value.info
          // ignore: cast_nullable_to_non_nullable
          : info as String?,
      event: event == const $CopyWithPlaceholder()
          ? _value.event
          // ignore: cast_nullable_to_non_nullable
          : event as EventModel?,
    );
  }
}

extension $CandidateModelCopyWith on CandidateModel {
  /// Returns a callable class that can be used as follows: `instanceOfCandidateModel.copyWith(...)` or like so:`instanceOfCandidateModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CandidateModelCWProxy get copyWith => _$CandidateModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CandidateModel _$CandidateModelFromJson(Map<String, dynamic> json) =>
    CandidateModel(
      id: (toInt(json, 'id') as num?)?.toInt(),
      name: json['name'] as String?,
      info: json['info'] as String?,
      event: json['event'] == null
          ? null
          : EventModel.fromJson(json['event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CandidateModelToJson(CandidateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'info': instance.info,
      'event': instance.event,
    };
