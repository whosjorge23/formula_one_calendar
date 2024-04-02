// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'constructor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConstructorData _$ConstructorDataFromJson(Map<String, dynamic> json) =>
    ConstructorData(
      mrData: json['MRData'] == null
          ? null
          : MRDConstructorData.fromJson(json['MRData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConstructorDataToJson(ConstructorData instance) =>
    <String, dynamic>{
      'MRData': instance.mrData,
    };

MRDConstructorData _$MRDConstructorDataFromJson(Map<String, dynamic> json) =>
    MRDConstructorData(
      xmlns: json['xmlns'] as String?,
      series: json['series'] as String?,
      url: json['url'] as String?,
      limit: json['limit'] as String?,
      offset: json['offset'] as String?,
      total: json['total'] as String?,
      constructorTable: json['ConstructorTable'] == null
          ? null
          : ConstructorTable.fromJson(
              json['ConstructorTable'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MRDConstructorDataToJson(MRDConstructorData instance) =>
    <String, dynamic>{
      'xmlns': instance.xmlns,
      'series': instance.series,
      'url': instance.url,
      'limit': instance.limit,
      'offset': instance.offset,
      'total': instance.total,
      'ConstructorTable': instance.constructorTable,
    };

ConstructorTable _$ConstructorTableFromJson(Map<String, dynamic> json) =>
    ConstructorTable(
      season: json['season'] as String?,
      constructors: (json['Constructors'] as List<dynamic>?)
          ?.map((e) => Constructors.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConstructorTableToJson(ConstructorTable instance) =>
    <String, dynamic>{
      'season': instance.season,
      'Constructors': instance.constructors,
    };

Constructors _$ConstructorsFromJson(Map<String, dynamic> json) => Constructors(
      constructorId: json['constructorId'] as String?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      nationality: json['nationality'] as String?,
    );

Map<String, dynamic> _$ConstructorsToJson(Constructors instance) =>
    <String, dynamic>{
      'constructorId': instance.constructorId,
      'url': instance.url,
      'name': instance.name,
      'nationality': instance.nationality,
    };
