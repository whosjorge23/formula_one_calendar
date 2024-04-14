// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverResult _$DriverResultFromJson(Map<String, dynamic> json) => DriverResult(
      driverResult: json['driverResult'] as int?,
      constructor: json['constructor'] == null
          ? null
          : Constructors.fromJson(json['constructor'] as Map<String, dynamic>),
      driver: json['driver'] == null
          ? null
          : Driver.fromJson(json['driver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DriverResultToJson(DriverResult instance) =>
    <String, dynamic>{
      'driver': instance.driver,
      'constructor': instance.constructor,
      'driverResult': instance.driverResult,
    };
