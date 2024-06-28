// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EventModelCWProxy {
  EventModel id(String? id);

  EventModel name(String? name);

  EventModel description(String? description);

  EventModel suiEventId(String? suiEventId);

  EventModel startDate(String? startDate);

  EventModel endDate(String? endDate);

  EventModel type(String? type);

  EventModel imageName(String? imageName);

  EventModel imageUrl(String? imageUrl);

  EventModel candidates(List<CandidateModel>? candidates);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EventModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EventModel(...).copyWith(id: 12, name: "My name")
  /// ````
  EventModel call({
    String? id,
    String? name,
    String? description,
    String? suiEventId,
    String? startDate,
    String? endDate,
    String? type,
    String? imageName,
    String? imageUrl,
    List<CandidateModel>? candidates,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEventModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEventModel.copyWith.fieldName(...)`
class _$EventModelCWProxyImpl implements _$EventModelCWProxy {
  const _$EventModelCWProxyImpl(this._value);

  final EventModel _value;

  @override
  EventModel id(String? id) => this(id: id);

  @override
  EventModel name(String? name) => this(name: name);

  @override
  EventModel description(String? description) => this(description: description);

  @override
  EventModel suiEventId(String? suiEventId) => this(suiEventId: suiEventId);

  @override
  EventModel startDate(String? startDate) => this(startDate: startDate);

  @override
  EventModel endDate(String? endDate) => this(endDate: endDate);

  @override
  EventModel type(String? type) => this(type: type);

  @override
  EventModel imageName(String? imageName) => this(imageName: imageName);

  @override
  EventModel imageUrl(String? imageUrl) => this(imageUrl: imageUrl);

  @override
  EventModel candidates(List<CandidateModel>? candidates) =>
      this(candidates: candidates);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EventModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EventModel(...).copyWith(id: 12, name: "My name")
  /// ````
  EventModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? suiEventId = const $CopyWithPlaceholder(),
    Object? startDate = const $CopyWithPlaceholder(),
    Object? endDate = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? imageName = const $CopyWithPlaceholder(),
    Object? imageUrl = const $CopyWithPlaceholder(),
    Object? candidates = const $CopyWithPlaceholder(),
  }) {
    return EventModel(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      suiEventId: suiEventId == const $CopyWithPlaceholder()
          ? _value.suiEventId
          // ignore: cast_nullable_to_non_nullable
          : suiEventId as String?,
      startDate: startDate == const $CopyWithPlaceholder()
          ? _value.startDate
          // ignore: cast_nullable_to_non_nullable
          : startDate as String?,
      endDate: endDate == const $CopyWithPlaceholder()
          ? _value.endDate
          // ignore: cast_nullable_to_non_nullable
          : endDate as String?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String?,
      imageName: imageName == const $CopyWithPlaceholder()
          ? _value.imageName
          // ignore: cast_nullable_to_non_nullable
          : imageName as String?,
      imageUrl: imageUrl == const $CopyWithPlaceholder()
          ? _value.imageUrl
          // ignore: cast_nullable_to_non_nullable
          : imageUrl as String?,
      candidates: candidates == const $CopyWithPlaceholder()
          ? _value.candidates
          // ignore: cast_nullable_to_non_nullable
          : candidates as List<CandidateModel>?,
    );
  }
}

extension $EventModelCopyWith on EventModel {
  /// Returns a callable class that can be used as follows: `instanceOfEventModel.copyWith(...)` or like so:`instanceOfEventModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EventModelCWProxy get copyWith => _$EventModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      suiEventId: json['suiEventId'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      type: json['type'] as String?,
      imageName: json['imageName'] as String?,
      imageUrl: json['imageUrl'] as String?,
      candidates: (json['candidates'] as List<dynamic>?)
          ?.map((e) => CandidateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'suiEventId': instance.suiEventId,
      'imageName': instance.imageName,
      'imageUrl': instance.imageUrl,
      'type': instance.type,
      'candidates': instance.candidates,
    };
