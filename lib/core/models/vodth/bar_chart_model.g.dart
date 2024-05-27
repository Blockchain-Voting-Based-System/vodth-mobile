// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bar_chart_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BarChartModelCWProxy {
  BarChartModel candidateName(String? candidateName);

  BarChartModel votes(int? votes);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BarChartModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BarChartModel(...).copyWith(id: 12, name: "My name")
  /// ````
  BarChartModel call({
    String? candidateName,
    int? votes,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBarChartModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBarChartModel.copyWith.fieldName(...)`
class _$BarChartModelCWProxyImpl implements _$BarChartModelCWProxy {
  const _$BarChartModelCWProxyImpl(this._value);

  final BarChartModel _value;

  @override
  BarChartModel candidateName(String? candidateName) =>
      this(candidateName: candidateName);

  @override
  BarChartModel votes(int? votes) => this(votes: votes);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BarChartModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BarChartModel(...).copyWith(id: 12, name: "My name")
  /// ````
  BarChartModel call({
    Object? candidateName = const $CopyWithPlaceholder(),
    Object? votes = const $CopyWithPlaceholder(),
  }) {
    return BarChartModel(
      candidateName: candidateName == const $CopyWithPlaceholder()
          ? _value.candidateName
          // ignore: cast_nullable_to_non_nullable
          : candidateName as String?,
      votes: votes == const $CopyWithPlaceholder()
          ? _value.votes
          // ignore: cast_nullable_to_non_nullable
          : votes as int?,
    );
  }
}

extension $BarChartModelCopyWith on BarChartModel {
  /// Returns a callable class that can be used as follows: `instanceOfBarChartModel.copyWith(...)` or like so:`instanceOfBarChartModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BarChartModelCWProxy get copyWith => _$BarChartModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarChartModel _$BarChartModelFromJson(Map<String, dynamic> json) =>
    BarChartModel(
      candidateName: json['candidateName'] as String?,
      votes: (json['votes'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BarChartModelToJson(BarChartModel instance) =>
    <String, dynamic>{
      'candidateName': instance.candidateName,
      'votes': instance.votes,
    };
