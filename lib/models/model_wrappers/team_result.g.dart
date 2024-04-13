// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamResult _$TeamResultFromJson(Map<String, dynamic> json) => TeamResult(
      constructorsResult: json['constructorsResult'] as int?,
      constructors: json['constructors'] == null
          ? null
          : Constructors.fromJson(json['constructors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeamResultToJson(TeamResult instance) =>
    <String, dynamic>{
      'constructors': instance.constructors,
      'constructorsResult': instance.constructorsResult,
    };
