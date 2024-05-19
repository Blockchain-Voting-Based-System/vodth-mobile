// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EventModelCWProxy {
  EventModel id(int? id);

  EventModel title(String? title);

  EventModel description(String? description);

  EventModel startDate(DateTime? startDate);

  EventModel endDate(DateTime? endDate);

  EventModel activate(bool? activate);

  EventModel bannerUrl(String? bannerUrl);

  EventModel candidates(List<CandidateModel>? candidates);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EventModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EventModel(...).copyWith(id: 12, name: "My name")
  /// ````
  EventModel call({
    int? id,
    String? title,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    bool? activate,
    String? bannerUrl,
    List<CandidateModel>? candidates,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEventModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEventModel.copyWith.fieldName(...)`
class _$EventModelCWProxyImpl implements _$EventModelCWProxy {
  const _$EventModelCWProxyImpl(this._value);

  final EventModel _value;

  @override
  EventModel id(int? id) => this(id: id);

  @override
  EventModel title(String? title) => this(title: title);

  @override
  EventModel description(String? description) => this(description: description);

  @override
  EventModel startDate(DateTime? startDate) => this(startDate: startDate);

  @override
  EventModel endDate(DateTime? endDate) => this(endDate: endDate);

  @override
  EventModel activate(bool? activate) => this(activate: activate);

  @override
  EventModel bannerUrl(String? bannerUrl) => this(bannerUrl: bannerUrl);

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
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? startDate = const $CopyWithPlaceholder(),
    Object? endDate = const $CopyWithPlaceholder(),
    Object? activate = const $CopyWithPlaceholder(),
    Object? bannerUrl = const $CopyWithPlaceholder(),
    Object? candidates = const $CopyWithPlaceholder(),
  }) {
    return EventModel(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      startDate: startDate == const $CopyWithPlaceholder()
          ? _value.startDate
          // ignore: cast_nullable_to_non_nullable
          : startDate as DateTime?,
      endDate: endDate == const $CopyWithPlaceholder()
          ? _value.endDate
          // ignore: cast_nullable_to_non_nullable
          : endDate as DateTime?,
      activate: activate == const $CopyWithPlaceholder()
          ? _value.activate
          // ignore: cast_nullable_to_non_nullable
          : activate as bool?,
      bannerUrl: bannerUrl == const $CopyWithPlaceholder()
          ? _value.bannerUrl
          // ignore: cast_nullable_to_non_nullable
          : bannerUrl as String?,
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
      id: (toInt(json, 'id') as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      activate: json['activate'] as bool?,
      bannerUrl: json['bannerUrl'] as String?,
      candidates: (json['candidates'] as List<dynamic>?)
          ?.map((e) => CandidateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'activate': instance.activate,
      'bannerUrl': instance.bannerUrl,
      'candidates': instance.candidates,
    };
