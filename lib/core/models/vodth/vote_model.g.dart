// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VoteModelCWProxy {
  VoteModel id(int? id);

  VoteModel user(UserModel? user);

  VoteModel event(EventModel? event);

  VoteModel candidate(CandidateModel? candidate);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VoteModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VoteModel(...).copyWith(id: 12, name: "My name")
  /// ````
  VoteModel call({
    int? id,
    UserModel? user,
    EventModel? event,
    CandidateModel? candidate,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVoteModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVoteModel.copyWith.fieldName(...)`
class _$VoteModelCWProxyImpl implements _$VoteModelCWProxy {
  const _$VoteModelCWProxyImpl(this._value);

  final VoteModel _value;

  @override
  VoteModel id(int? id) => this(id: id);

  @override
  VoteModel user(UserModel? user) => this(user: user);

  @override
  VoteModel event(EventModel? event) => this(event: event);

  @override
  VoteModel candidate(CandidateModel? candidate) => this(candidate: candidate);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VoteModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VoteModel(...).copyWith(id: 12, name: "My name")
  /// ````
  VoteModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
    Object? event = const $CopyWithPlaceholder(),
    Object? candidate = const $CopyWithPlaceholder(),
  }) {
    return VoteModel(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as UserModel?,
      event: event == const $CopyWithPlaceholder()
          ? _value.event
          // ignore: cast_nullable_to_non_nullable
          : event as EventModel?,
      candidate: candidate == const $CopyWithPlaceholder()
          ? _value.candidate
          // ignore: cast_nullable_to_non_nullable
          : candidate as CandidateModel?,
    );
  }
}

extension $VoteModelCopyWith on VoteModel {
  /// Returns a callable class that can be used as follows: `instanceOfVoteModel.copyWith(...)` or like so:`instanceOfVoteModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VoteModelCWProxy get copyWith => _$VoteModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoteModel _$VoteModelFromJson(Map<String, dynamic> json) => VoteModel(
      id: (json['id'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      event: json['event'] == null
          ? null
          : EventModel.fromJson(json['event'] as Map<String, dynamic>),
      candidate: json['candidate'] == null
          ? null
          : CandidateModel.fromJson(json['candidate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VoteModelToJson(VoteModel instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'event': instance.event,
      'candidate': instance.candidate,
    };
