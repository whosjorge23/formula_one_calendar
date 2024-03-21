import 'package:json_annotation/json_annotation.dart';

part 'race.g.dart';

@JsonSerializable()
class RaceData {
  @JsonKey(name: "MRData")
  MRData? mrData;

  RaceData({
    this.mrData,
  });

  factory RaceData.fromJson(Map<String, dynamic> json) => _$RaceDataFromJson(json);

  Map<String, dynamic> toJson() => _$RaceDataToJson(this);
}

@JsonSerializable()
class MRData {
  @JsonKey(name: "RaceTable")
  RaceTable? raceTable;

  MRData({
    this.raceTable,
  });

  factory MRData.fromJson(Map<String, dynamic> json) => _$MRDataFromJson(json);

  Map<String, dynamic> toJson() => _$MRDataToJson(this);
}

@JsonSerializable()
class RaceTable {
  @JsonKey(name: "Races")
  List<Race> races;

  RaceTable({
    required this.races,
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
  String? date;
  @JsonKey(name: "time")
  String? time;
  @JsonKey(name: "FirstPractice")
  Practice? firstPractice;
  @JsonKey(name: "SecondPractice")
  Practice? secondPractice;
  @JsonKey(name: "ThirdPractice")
  Practice? thirdPractice;
  @JsonKey(name: "Qualifying")
  Practice? qualifying;

  Race({
    this.season,
    this.round,
    this.url,
    this.raceName,
    this.circuit,
    this.date,
    this.time,
    this.firstPractice,
    this.secondPractice,
    this.thirdPractice,
    this.qualifying,
  });

  factory Race.fromJson(Map<String, dynamic> json) => _$RaceFromJson(json);

  Map<String, dynamic> toJson() => _$RaceToJson(this);
}

@JsonSerializable()
class Circuit {
  @JsonKey(name: "circuitId")
  String? circuitId;
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "circuitName")
  String? circuitName;
  @JsonKey(name: "Location")
  Location? location;

  Circuit({
    this.circuitId,
    this.url,
    this.circuitName,
    this.location,
  });

  factory Circuit.fromJson(Map<String, dynamic> json) => _$CircuitFromJson(json);

  Map<String, dynamic> toJson() => _$CircuitToJson(this);
}

@JsonSerializable()
class Location {
  @JsonKey(name: "lat")
  String? lat;
  @JsonKey(name: "long")
  String? long;
  @JsonKey(name: "locality")
  String? locality;
  @JsonKey(name: "country")
  String? country;

  Location({
    this.lat,
    this.long,
    this.locality,
    this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Practice {
  @JsonKey(name: "date")
  String? date;
  @JsonKey(name: "time")
  String? time;

  Practice({
    this.date,
    this.time,
  });

  factory Practice.fromJson(Map<String, dynamic> json) => _$PracticeFromJson(json);

  Map<String, dynamic> toJson() => _$PracticeToJson(this);
}
