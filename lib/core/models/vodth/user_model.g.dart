// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserModelCWProxy {
  UserModel id(int? id);

  UserModel firstName(String? firstName);

  UserModel lastName(String? lastName);

  UserModel email(String? email);

  UserModel vote(VoteModel? vote);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserModel(...).copyWith(id: 12, name: "My name")
  /// ````
  UserModel call({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    VoteModel? vote,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserModel.copyWith.fieldName(...)`
class _$UserModelCWProxyImpl implements _$UserModelCWProxy {
  const _$UserModelCWProxyImpl(this._value);

  final UserModel _value;

  @override
  UserModel id(int? id) => this(id: id);

  @override
  UserModel firstName(String? firstName) => this(firstName: firstName);

  @override
  UserModel lastName(String? lastName) => this(lastName: lastName);

  @override
  UserModel email(String? email) => this(email: email);

  @override
  UserModel vote(VoteModel? vote) => this(vote: vote);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserModel(...).copyWith(id: 12, name: "My name")
  /// ````
  UserModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? firstName = const $CopyWithPlaceholder(),
    Object? lastName = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? vote = const $CopyWithPlaceholder(),
  }) {
    return UserModel(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      firstName: firstName == const $CopyWithPlaceholder()
          ? _value.firstName
          // ignore: cast_nullable_to_non_nullable
          : firstName as String?,
      lastName: lastName == const $CopyWithPlaceholder()
          ? _value.lastName
          // ignore: cast_nullable_to_non_nullable
          : lastName as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      vote: vote == const $CopyWithPlaceholder()
          ? _value.vote
          // ignore: cast_nullable_to_non_nullable
          : vote as VoteModel?,
    );
  }
}

extension $UserModelCopyWith on UserModel {
  /// Returns a callable class that can be used as follows: `instanceOfUserModel.copyWith(...)` or like so:`instanceOfUserModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserModelCWProxy get copyWith => _$UserModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: (toInt(json, 'id') as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      vote: json['vote'] == null
          ? null
          : VoteModel.fromJson(json['vote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'vote': instance.vote,
    };
