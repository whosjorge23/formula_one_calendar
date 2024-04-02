// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'race.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RaceData _$RaceDataFromJson(Map<String, dynamic> json) => RaceData(
      mrData: json['MRData'] == null
          ? null
          : MRData.fromJson(json['MRData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RaceDataToJson(RaceData instance) => <String, dynamic>{
      'MRData': instance.mrData,
    };

MRData _$MRDataFromJson(Map<String, dynamic> json) => MRData(
      raceTable: json['RaceTable'] == null
          ? null
          : RaceTable.fromJson(json['RaceTable'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MRDataToJson(MRData instance) => <String, dynamic>{
      'RaceTable': instance.raceTable,
    };

RaceTable _$RaceTableFromJson(Map<String, dynamic> json) => RaceTable(
      races: (json['Races'] as List<dynamic>)
          .map((e) => Race.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RaceTableToJson(RaceTable instance) => <String, dynamic>{
      'Races': instance.races,
    };

Race _$RaceFromJson(Map<String, dynamic> json) => Race(
      season: json['season'] as String?,
      round: json['round'] as String?,
      url: json['url'] as String?,
      raceName: json['raceName'] as String?,
      circuit: json['Circuit'] == null
          ? null
          : Circuit.fromJson(json['Circuit'] as Map<String, dynamic>),
      date: json['date'] as String?,
      time: json['time'] as String?,
      firstPractice: json['FirstPractice'] == null
          ? null
          : Practice.fromJson(json['FirstPractice'] as Map<String, dynamic>),
      secondPractice: json['SecondPractice'] == null
          ? null
          : Practice.fromJson(json['SecondPractice'] as Map<String, dynamic>),
      thirdPractice: json['ThirdPractice'] == null
          ? null
          : Practice.fromJson(json['ThirdPractice'] as Map<String, dynamic>),
      qualifying: json['Qualifying'] == null
          ? null
          : Practice.fromJson(json['Qualifying'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RaceToJson(Race instance) => <String, dynamic>{
      'season': instance.season,
      'round': instance.round,
      'url': instance.url,
      'raceName': instance.raceName,
      'Circuit': instance.circuit,
      'date': instance.date,
      'time': instance.time,
      'FirstPractice': instance.firstPractice,
      'SecondPractice': instance.secondPractice,
      'ThirdPractice': instance.thirdPractice,
      'Qualifying': instance.qualifying,
    };

Circuit _$CircuitFromJson(Map<String, dynamic> json) => Circuit(
      circuitId: json['circuitId'] as String?,
      url: json['url'] as String?,
      circuitName: json['circuitName'] as String?,
      location: json['Location'] == null
          ? null
          : Location.fromJson(json['Location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CircuitToJson(Circuit instance) => <String, dynamic>{
      'circuitId': instance.circuitId,
      'url': instance.url,
      'circuitName': instance.circuitName,
      'Location': instance.location,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      locality: json['locality'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
      'locality': instance.locality,
      'country': instance.country,
    };

Practice _$PracticeFromJson(Map<String, dynamic> json) => Practice(
      date: json['date'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$PracticeToJson(Practice instance) => <String, dynamic>{
      'date': instance.date,
      'time': instance.time,
    };
