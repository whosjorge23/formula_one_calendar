import 'package:formula_one_calendar/models/constructor.dart';
import 'package:formula_one_calendar/models/driver.dart';
import 'package:formula_one_calendar/models/race.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class ResultData {
  @JsonKey(name: "MRData")
  MrData? mrData;

  ResultData({
    this.mrData,
  });

  factory ResultData.fromJson(Map<String, dynamic> json) => _$ResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResultDataToJson(this);
}

@JsonSerializable()
class MrData {
  @JsonKey(name: "xmlns")
  String? xmlns;
  @JsonKey(name: "series")
  String? series;
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "limit")
  String? limit;
  @JsonKey(name: "offset")
  String? offset;
  @JsonKey(name: "total")
  String? total;
  @JsonKey(name: "RaceTable")
  RaceTable? raceTable;

  MrData({
    this.xmlns,
    this.series,
    this.url,
    this.limit,
    this.offset,
    this.total,
    this.raceTable,
  });

  factory MrData.fromJson(Map<String, dynamic> json) => _$MrDataFromJson(json);

  Map<String, dynamic> toJson() => _$MrDataToJson(this);
}

@JsonSerializable()
class RaceTable {
  @JsonKey(name: "season")
  String? season;
  @JsonKey(name: "round")
  String? round;
  @JsonKey(name: "Races")
  List<Race>? races;

  RaceTable({
    this.season,
    this.round,
    this.races,
  });

  factory RaceTable.fromJson(Map<String, dynamic> json) => _$RaceTableFromJson(json);

  Map<String, dynamic> toJson() => _$RaceTableToJson(this);
}

@JsonSerializable()
class Race {
  @JsonKey(name: "season")
  String? season;
  @JsonKey(name: "round")
  String? round;
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "raceName")
  String? raceName;
  @JsonKey(name: "Circuit")
  Circuit? circuit;
  @JsonKey(name: "date")
  DateTime? date;
  @JsonKey(name: "time")
  String? time;
  @JsonKey(name: "Results")
  List<Result>? results;

  Race({
    this.season,
    this.round,
    this.url,
    this.raceName,
    this.circuit,
    this.date,
    this.time,
    this.results,
  });

  factory Race.fromJson(Map<String, dynamic> json) => _$RaceFromJson(json);

  Map<String, dynamic> toJson() => _$RaceToJson(this);
}

// @JsonSerializable()
// class Circuit {
//   @JsonKey(name: "circuitId")
//   String? circuitId;
//   @JsonKey(name: "url")
//   String? url;
//   @JsonKey(name: "circuitName")
//   String? circuitName;
//   @JsonKey(name: "Location")
//   Location? location;
//
//   Circuit({
//     this.circuitId,
//     this.url,
//     this.circuitName,
//     this.location,
//   });
//
//   factory Circuit.fromJson(Map<String, dynamic> json) => _$CircuitFromJson(json);
//
//   Map<String, dynamic> toJson() => _$CircuitToJson(this);
// }
//
// @JsonSerializable()
// class Location {
//   @JsonKey(name: "lat")
//   String? lat;
//   @JsonKey(name: "long")
//   String? long;
//   @JsonKey(name: "locality")
//   String? locality;
//   @JsonKey(name: "country")
//   String? country;
//
//   Location({
//     this.lat,
//     this.long,
//     this.locality,
//     this.country,
//   });
//
//   factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
//
//   Map<String, dynamic> toJson() => _$LocationToJson(this);
// }

@JsonSerializable()
class Result {
  @JsonKey(name: "number")
  String? number;
  @JsonKey(name: "position")
  String? position;
  @JsonKey(name: "positionText")
  String? positionText;
  @JsonKey(name: "points")
  String? points;
  @JsonKey(name: "Driver")
  Driver? driver;
  @JsonKey(name: "Constructor")
  Constructors? constructor;
  @JsonKey(name: "grid")
  String? grid;
  @JsonKey(name: "laps")
  String? laps;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "Time")
  ResultTime? time;
  @JsonKey(name: "FastestLap")
  FastestLap? fastestLap;

  Result({
    this.number,
    this.position,
    this.positionText,
    this.points,
    this.driver,
    this.constructor,
    this.grid,
    this.laps,
    this.status,
    this.time,
    this.fastestLap,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

// @JsonSerializable()
// class Constructor {
//   @JsonKey(name: "constructorId")
//   String? constructorId;
//   @JsonKey(name: "url")
//   String? url;
//   @JsonKey(name: "name")
//   String? name;
//   @JsonKey(name: "nationality")
//   String? nationality;
//
//   Constructor({
//     this.constructorId,
//     this.url,
//     this.name,
//     this.nationality,
//   });
//
//   factory Constructor.fromJson(Map<String, dynamic> json) => _$ConstructorFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ConstructorToJson(this);
// }

// @JsonSerializable()
// class Driver {
//   @JsonKey(name: "driverId")
//   String? driverId;
//   @JsonKey(name: "permanentNumber")
//   String? permanentNumber;
//   @JsonKey(name: "code")
//   String? code;
//   @JsonKey(name: "url")
//   String? url;
//   @JsonKey(name: "givenName")
//   String? givenName;
//   @JsonKey(name: "familyName")
//   String? familyName;
//   @JsonKey(name: "dateOfBirth")
//   DateTime? dateOfBirth;
//   @JsonKey(name: "nationality")
//   String? nationality;
//
//   Driver({
//     this.driverId,
//     this.permanentNumber,
//     this.code,
//     this.url,
//     this.givenName,
//     this.familyName,
//     this.dateOfBirth,
//     this.nationality,
//   });
//
//   factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);
//
//   Map<String, dynamic> toJson() => _$DriverToJson(this);
// }

@JsonSerializable()
class FastestLap {
  @JsonKey(name: "rank")
  String? rank;
  @JsonKey(name: "lap")
  String? lap;
  @JsonKey(name: "Time")
  FastestLapTime? time;
  @JsonKey(name: "AverageSpeed")
  AverageSpeed? averageSpeed;

  FastestLap({
    this.rank,
    this.lap,
    this.time,
    this.averageSpeed,
  });

  factory FastestLap.fromJson(Map<String, dynamic> json) => _$FastestLapFromJson(json);

  Map<String, dynamic> toJson() => _$FastestLapToJson(this);
}

@JsonSerializable()
class AverageSpeed {
  @JsonKey(name: "units")
  String? units;
  @JsonKey(name: "speed")
  String? speed;

  AverageSpeed({
    this.units,
    this.speed,
  });

  factory AverageSpeed.fromJson(Map<String, dynamic> json) => _$AverageSpeedFromJson(json);

  Map<String, dynamic> toJson() => _$AverageSpeedToJson(this);
}

@JsonSerializable()
class FastestLapTime {
  @JsonKey(name: "time")
  String? time;

  FastestLapTime({
    this.time,
  });

  factory FastestLapTime.fromJson(Map<String, dynamic> json) => _$FastestLapTimeFromJson(json);

  Map<String, dynamic> toJson() => _$FastestLapTimeToJson(this);
}

@JsonSerializable()
class ResultTime {
  @JsonKey(name: "millis")
  String? millis;
  @JsonKey(name: "time")
  String? time;

  ResultTime({
    this.millis,
    this.time,
  });

  factory ResultTime.fromJson(Map<String, dynamic> json) => _$ResultTimeFromJson(json);

  Map<String, dynamic> toJson() => _$ResultTimeToJson(this);
}
