// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverData _$DriverDataFromJson(Map<String, dynamic> json) => DriverData(
      mrData: json['MRData'] == null
          ? null
          : MrDriverData.fromJson(json['MRData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DriverDataToJson(DriverData instance) =>
    <String, dynamic>{
      'MRData': instance.mrData,
    };

MrDriverData _$MrDriverDataFromJson(Map<String, dynamic> json) => MrDriverData(
      driverTable: json['DriverTable'] == null
          ? null
          : DriverTable.fromJson(json['DriverTable'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MrDriverDataToJson(MrDriverData instance) =>
    <String, dynamic>{
      'DriverTable': instance.driverTable,
    };

DriverTable _$DriverTableFromJson(Map<String, dynamic> json) => DriverTable(
      drivers: (json['Drivers'] as List<dynamic>?)
          ?.map((e) => Driver.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DriverTableToJson(DriverTable instance) =>
    <String, dynamic>{
      'Drivers': instance.drivers,
    };

Driver _$DriverFromJson(Map<String, dynamic> json) => Driver(
      driverId: json['driverId'] as String?,
      permanentNumber: json['permanentNumber'] as String?,
      code: json['code'] as String?,
      url: json['url'] as String?,
      givenName: json['givenName'] as String?,
      familyName: json['familyName'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      nationality: json['nationality'] as String?,
    );

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      'driverId': instance.driverId,
      'permanentNumber': instance.permanentNumber,
      'code': instance.code,
      'url': instance.url,
      'givenName': instance.givenName,
      'familyName': instance.familyName,
      'dateOfBirth': instance.dateOfBirth,
      'nationality': instance.nationality,
    };
