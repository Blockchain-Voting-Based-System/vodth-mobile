// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CandidateModelCWProxy {
  CandidateModel sex(String? sex);

  CandidateModel bio(String? bio);

  CandidateModel status(String? status);

  CandidateModel id(String? id);

  CandidateModel name(String? name);

  CandidateModel birthday(String? birthday);

  CandidateModel candidateId(String? candidateId);

  CandidateModel eventId(String? eventId);

  CandidateModel imageName(String? imageName);

  CandidateModel event(EventModel? event);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CandidateModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CandidateModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CandidateModel call({
    String? sex,
    String? bio,
    String? status,
    String? id,
    String? name,
    String? birthday,
    String? candidateId,
    String? eventId,
    String? imageName,
    EventModel? event,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCandidateModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCandidateModel.copyWith.fieldName(...)`
class _$CandidateModelCWProxyImpl implements _$CandidateModelCWProxy {
  const _$CandidateModelCWProxyImpl(this._value);

  final CandidateModel _value;

  @override
  CandidateModel sex(String? sex) => this(sex: sex);

  @override
  CandidateModel bio(String? bio) => this(bio: bio);

  @override
  CandidateModel status(String? status) => this(status: status);

  @override
  CandidateModel id(String? id) => this(id: id);

  @override
  CandidateModel name(String? name) => this(name: name);

  @override
  CandidateModel birthday(String? birthday) => this(birthday: birthday);

  @override
  CandidateModel candidateId(String? candidateId) =>
      this(candidateId: candidateId);

  @override
  CandidateModel eventId(String? eventId) => this(eventId: eventId);

  @override
  CandidateModel imageName(String? imageName) => this(imageName: imageName);

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
    Object? sex = const $CopyWithPlaceholder(),
    Object? bio = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? birthday = const $CopyWithPlaceholder(),
    Object? candidateId = const $CopyWithPlaceholder(),
    Object? eventId = const $CopyWithPlaceholder(),
    Object? imageName = const $CopyWithPlaceholder(),
    Object? event = const $CopyWithPlaceholder(),
  }) {
    return CandidateModel(
      sex: sex == const $CopyWithPlaceholder()
          ? _value.sex
          // ignore: cast_nullable_to_non_nullable
          : sex as String?,
      bio: bio == const $CopyWithPlaceholder()
          ? _value.bio
          // ignore: cast_nullable_to_non_nullable
          : bio as String?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      birthday: birthday == const $CopyWithPlaceholder()
          ? _value.birthday
          // ignore: cast_nullable_to_non_nullable
          : birthday as String?,
      candidateId: candidateId == const $CopyWithPlaceholder()
          ? _value.candidateId
          // ignore: cast_nullable_to_non_nullable
          : candidateId as String?,
      eventId: eventId == const $CopyWithPlaceholder()
          ? _value.eventId
          // ignore: cast_nullable_to_non_nullable
          : eventId as String?,
      imageName: imageName == const $CopyWithPlaceholder()
          ? _value.imageName
          // ignore: cast_nullable_to_non_nullable
          : imageName as String?,
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
      sex: json['sex'] as String?,
      bio: json['bio'] as String?,
      status: json['status'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      birthday: json['birthday'] as String?,
      candidateId: json['candidateId'] as String?,
      eventId: json['eventId'] as String?,
      imageName: json['imageName'] as String?,
      event: json['event'] == null
          ? null
          : EventModel.fromJson(json['event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CandidateModelToJson(CandidateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'birthday': instance.birthday,
      'candidateId': instance.candidateId,
      'eventId': instance.eventId,
      'imageName': instance.imageName,
      'name': instance.name,
      'sex': instance.sex,
      'status': instance.status,
      'bio': instance.bio,
      'event': instance.event,
    };
