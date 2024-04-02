// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultData _$ResultDataFromJson(Map<String, dynamic> json) => ResultData(
      mrData: json['MRData'] == null
          ? null
          : MrData.fromJson(json['MRData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultDataToJson(ResultData instance) =>
    <String, dynamic>{
      'MRData': instance.mrData,
    };

MrData _$MrDataFromJson(Map<String, dynamic> json) => MrData(
      xmlns: json['xmlns'] as String?,
      series: json['series'] as String?,
      url: json['url'] as String?,
      limit: json['limit'] as String?,
      offset: json['offset'] as String?,
      total: json['total'] as String?,
      raceTable: json['RaceTable'] == null
          ? null
          : RaceTable.fromJson(json['RaceTable'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MrDataToJson(MrData instance) => <String, dynamic>{
      'xmlns': instance.xmlns,
      'series': instance.series,
      'url': instance.url,
      'limit': instance.limit,
      'offset': instance.offset,
      'total': instance.total,
      'RaceTable': instance.raceTable,
    };

RaceTable _$RaceTableFromJson(Map<String, dynamic> json) => RaceTable(
      season: json['season'] as String?,
      round: json['round'] as String?,
      races: (json['Races'] as List<dynamic>?)
          ?.map((e) => Race.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RaceTableToJson(RaceTable instance) => <String, dynamic>{
      'season': instance.season,
      'round': instance.round,
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
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      time: json['time'] as String?,
      results: (json['Results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RaceToJson(Race instance) => <String, dynamic>{
      'season': instance.season,
      'round': instance.round,
      'url': instance.url,
      'raceName': instance.raceName,
      'Circuit': instance.circuit,
      'date': instance.date?.toIso8601String(),
      'time': instance.time,
      'Results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      number: json['number'] as String?,
      position: json['position'] as String?,
      positionText: json['positionText'] as String?,
      points: json['points'] as String?,
      driver: json['Driver'] == null
          ? null
          : Driver.fromJson(json['Driver'] as Map<String, dynamic>),
      constructor: json['Constructor'] == null
          ? null
          : Constructors.fromJson(json['Constructor'] as Map<String, dynamic>),
      grid: json['grid'] as String?,
      laps: json['laps'] as String?,
      status: json['status'] as String?,
      time: json['Time'] == null
          ? null
          : ResultTime.fromJson(json['Time'] as Map<String, dynamic>),
      fastestLap: json['FastestLap'] == null
          ? null
          : FastestLap.fromJson(json['FastestLap'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'number': instance.number,
      'position': instance.position,
      'positionText': instance.positionText,
      'points': instance.points,
      'Driver': instance.driver,
      'Constructor': instance.constructor,
      'grid': instance.grid,
      'laps': instance.laps,
      'status': instance.status,
      'Time': instance.time,
      'FastestLap': instance.fastestLap,
    };

FastestLap _$FastestLapFromJson(Map<String, dynamic> json) => FastestLap(
      rank: json['rank'] as String?,
      lap: json['lap'] as String?,
      time: json['Time'] == null
          ? null
          : FastestLapTime.fromJson(json['Time'] as Map<String, dynamic>),
      averageSpeed: json['AverageSpeed'] == null
          ? null
          : AverageSpeed.fromJson(json['AverageSpeed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FastestLapToJson(FastestLap instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'lap': instance.lap,
      'Time': instance.time,
      'AverageSpeed': instance.averageSpeed,
    };

AverageSpeed _$AverageSpeedFromJson(Map<String, dynamic> json) => AverageSpeed(
      units: json['units'] as String?,
      speed: json['speed'] as String?,
    );

Map<String, dynamic> _$AverageSpeedToJson(AverageSpeed instance) =>
    <String, dynamic>{
      'units': instance.units,
      'speed': instance.speed,
    };

FastestLapTime _$FastestLapTimeFromJson(Map<String, dynamic> json) =>
    FastestLapTime(
      time: json['time'] as String?,
    );

Map<String, dynamic> _$FastestLapTimeToJson(FastestLapTime instance) =>
    <String, dynamic>{
      'time': instance.time,
    };

ResultTime _$ResultTimeFromJson(Map<String, dynamic> json) => ResultTime(
      millis: json['millis'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$ResultTimeToJson(ResultTime instance) =>
    <String, dynamic>{
      'millis': instance.millis,
      'time': instance.time,
    };
