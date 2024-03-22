import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'constructor.g.dart';

@JsonSerializable()
class ConstructorData {
  @JsonKey(name: "MRData")
  MRDConstructorData? mrData;

  ConstructorData({
    this.mrData,
  });

  factory ConstructorData.fromJson(Map<String, dynamic> json) => _$ConstructorDataFromJson(json);

  Map<String, dynamic> toJson() => _$ConstructorDataToJson(this);
}

@JsonSerializable()
class MRDConstructorData {
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
  @JsonKey(name: "ConstructorTable")
  ConstructorTable? constructorTable;

  MRDConstructorData({
    this.xmlns,
    this.series,
    this.url,
    this.limit,
    this.offset,
    this.total,
    this.constructorTable,
  });

  factory MRDConstructorData.fromJson(Map<String, dynamic> json) => _$MRDConstructorDataFromJson(json);

  Map<String, dynamic> toJson() => _$MRDConstructorDataToJson(this);
}

@JsonSerializable()
class ConstructorTable {
  @JsonKey(name: "season")
  String? season;
  @JsonKey(name: "Constructors")
  List<Constructors>? constructors;

  ConstructorTable({
    this.season,
    this.constructors,
  });

  factory ConstructorTable.fromJson(Map<String, dynamic> json) => _$ConstructorTableFromJson(json);

  Map<String, dynamic> toJson() => _$ConstructorTableToJson(this);
}

@JsonSerializable()
class Constructors {
  @JsonKey(name: "constructorId")
  String? constructorId;
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "nationality")
  String? nationality;

  Constructors({
    this.constructorId,
    this.url,
    this.name,
    this.nationality,
  });

  factory Constructors.fromJson(Map<String, dynamic> json) => _$ConstructorsFromJson(json);

  Map<String, dynamic> toJson() => _$ConstructorsToJson(this);

  String get getConstructorFlag => constructorFlag[nationality] ?? "";

  String get getConstructorImage => constructorImage[name] ?? "";

  String get getConstructorImageEXT => constructorImageEXT[name] ?? "";

  String get getConstructorCarImage => constructorCarImage[name] ?? "";

  String get getConstructorPowerUnit => constructorPowerUnit[name] ?? "";

  List<String> get getConstructorDrivers => constructorDrivers[name] ?? [];

  List<String> get getConstructorDriversID => constructorDriversID[name] ?? [];

  String get getConstructorFullname => constructorFullname[name] ?? "";

  String get getConstructorBase => constructorBase[name] ?? "";

  String get getConstructorEntryYear => constructorEntryYear[name] ?? "";

  Color get getConstructorColor => constructorColor[name] ?? const Color(0xFFFE9809);

  static Map<String, String> constructorFlag = {
    'Swiss': '🇨🇭',
    'British': '🇬🇧',
    'French': '🇫🇷',
    'German': '🇩🇪',
    'American': '🇺🇸',
    'Italian': '🇮🇹',
    'Austrian': '🇦🇹',
  };

  static Map<String, String> constructorImage = {
    'Alfa Romeo':
        'https://media.formula1.com/content/dam/fom-website/teams/2023/alfa-romeo-logo.png.transform/2col-retina/image.png',
    'AlphaTauri':
        'https://media.formula1.com/content/dam/fom-website/teams/2023/alphatauri-logo.png.transform/2col-retina/image.png',
    'Alpine F1 Team':
        'https://media.formula1.com/content/dam/fom-website/teams/2023/alpine-logo.png.transform/2col-retina/image.png',
    'Aston Martin':
        'https://media.formula1.com/content/dam/fom-website/teams/2023/aston-martin-logo.png.transform/2col-retina/image.png',
    'Ferrari':
        'https://media.formula1.com/content/dam/fom-website/teams/2023/ferrari-logo.png.transform/2col-retina/image.png',
    'Haas F1 Team':
        'https://media.formula1.com/content/dam/fom-website/teams/2023/haas-f1-team-logo.png.transform/2col-retina/image.png',
    'McLaren':
        'https://media.formula1.com/content/dam/fom-website/teams/2023/mclaren-logo.png.transform/2col-retina/image.png',
    'Mercedes':
        'https://media.formula1.com/content/dam/fom-website/teams/2023/mercedes-logo.png.transform/2col-retina/image.png',
    'Red Bull':
        'https://media.formula1.com/content/dam/fom-website/teams/2023/red-bull-racing-logo.png.transform/2col-retina/image.png',
    'Williams':
        'https://media.formula1.com/content/dam/fom-website/teams/2023/williams-logo.png.transform/2col-retina/image.png',
  };

  static Map<String, String> constructorImageEXT = {
    'Alfa Romeo':
        'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/team%20logos/alfa%20romeo.jpg',
    'AlphaTauri': 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/team%20logos/alphatauri.jpg',
    'Alpine F1 Team': 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/team%20logos/alpine.jpg',
    'Aston Martin':
        'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/team%20logos/aston%20martin.jpg',
    'Ferrari': 'https://media.formula1.com/content/dam/fom-website/teams/Ferrari/logo-ferrari-18%20.jpg',
    'Haas F1 Team': 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/team%20logos/haas.jpg',
    'McLaren': 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/team%20logos/mclaren.jpg',
    'Mercedes': 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/team%20logos/mercedes.jpg',
    'Red Bull': 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/team%20logos/red%20bull.jpg',
    'Williams': 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/team%20logos/williams.jpg',
  };

  static Map<String, String> constructorCarImage = {
    'Alfa Romeo':
        'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/alfa-romeo.png.transform/4col-retina/image.png',
    'AlphaTauri':
        'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/alphatauri.png.transform/4col-retina/image.png',
    'Alpine F1 Team':
        'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/alpine.png.transform/4col-retina/image.png',
    'Aston Martin':
        'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/aston-martin.png.transform/4col-retina/image.png',
    'Ferrari':
        'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/ferrari.png.transform/4col-retina/image.png',
    'Haas F1 Team':
        'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/haas-f1-team.png.transform/4col-retina/image.png',
    'McLaren':
        'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/mclaren.png.transform/4col-retina/image.png',
    'Mercedes':
        'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/mercedes.png.transform/4col-retina/image.png',
    'Red Bull':
        'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/red-bull-racing.png.transform/4col-retina/image.png',
    'Williams':
        'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/williams.png.transform/4col-retina/image.png',
  };

  static Map<String, String> constructorPowerUnit = {
    'Alfa Romeo': 'Ferrari',
    'AlphaTauri': 'Honda RBPT',
    'Alpine F1 Team': 'Renault',
    'Aston Martin': 'Mercedes',
    'Ferrari': 'Ferrari',
    'Haas F1 Team': 'Ferrari',
    'McLaren': 'Mercedes',
    'Mercedes': 'Mercedes',
    'Red Bull': 'Honda RBPT',
    'Williams': 'Mercedes',
  };

  static Map<String, List<String>> constructorDrivers = {
    'Alfa Romeo': ['Zhou Guanyu', 'Valtteri Bottas'],
    'AlphaTauri': ['Yuki Tsunoda', 'Nyck De Vries'],
    'Alpine F1 Team': ['Pierre Gasly', 'Esteban Ocon'],
    'Aston Martin': ['Lance Stroll', 'Fernando Alonso'],
    'Ferrari': ['Charles Leclerc', 'Carlos Sainz'],
    'Haas F1 Team': ['Kevin Magnussen', 'Nico Hulkenberg'],
    'McLaren': ['Lando Norris', 'Oscar Piastri'],
    'Mercedes': ['Lewis Hamilton', 'George Russell'],
    'Red Bull': ['Max Verstappen', 'Sergio Perez'],
    'Williams': ['Alexander Albon', 'Logan Sargeant'],
  };

  static Map<String, List<String>> constructorDriversID = {
    'Alfa Romeo': ['zhou', 'bottas'],
    'AlphaTauri': ['tsunoda', 'de_vries'],
    'Alpine F1 Team': ['gasly', 'ocon'],
    'Aston Martin': ['stroll', 'alonso'],
    'Ferrari': ['leclerc', 'sainz'],
    'Haas F1 Team': ['kevin_magnussen', 'hulkenberg'],
    'McLaren': ['norris', 'piastri'],
    'Mercedes': ['hamilton', 'russell'],
    'Red Bull': ['max_verstappen', 'perez'],
    'Williams': ['albon', 'sargeant'],
  };

  static Map<String, String> constructorFullname = {
    'Alfa Romeo': 'Alfa Romeo F1 Team Stake',
    'AlphaTauri': 'Scuderia AlphaTauri',
    'Alpine F1 Team': 'BWT Alpine F1 Team',
    'Aston Martin': 'Aston Martin Aramco Cognizant F1 Team',
    'Ferrari': 'Scuderia Ferrari',
    'Haas F1 Team': 'MoneyGram Haas F1 Team',
    'McLaren': 'McLaren F1 Team',
    'Mercedes': 'Mercedes-AMG PETRONAS F1 Team',
    'Red Bull': 'Oracle Red Bull Racing',
    'Williams': 'Williams Racing',
  };

  static Map<String, String> constructorBase = {
    'Alfa Romeo': 'Hinwil, Switzerland',
    'AlphaTauri': 'Faenza, Italy',
    'Alpine F1 Team': 'Enstone, United Kingdom',
    'Aston Martin': 'Silverstone, United Kingdom',
    'Ferrari': 'Maranello, Italy',
    'Haas F1 Team': 'Kannapolis, United States',
    'McLaren': 'Woking, United Kingdom',
    'Mercedes': 'Brackley, United Kingdom',
    'Red Bull': 'Milton Keynes, United Kingdom',
    'Williams': 'Grove, United Kingdom',
  };

  static Map<String, String> constructorEntryYear = {
    'Alfa Romeo': '1993',
    'AlphaTauri': '1985',
    'Alpine F1 Team': '1986',
    'Aston Martin': '2018',
    'Ferrari': '1950',
    'Haas F1 Team': '2016',
    'McLaren': '1966',
    'Mercedes': '1970',
    'Red Bull': '1997',
    'Williams': '1978',
  };

  static Map<String, Color> constructorColor = {
    'Alfa Romeo': const Color(0xFF930614),
    'AlphaTauri': const Color(0xFF314051),
    'Alpine F1 Team': const Color(0xFF056AAF),
    'Aston Martin': const Color(0xFF00594E),
    'Ferrari': const Color(0xFFCC151C),
    'Haas F1 Team': const Color(0xFF151212),
    'McLaren': const Color(0xFFFE9809),
    'Mercedes': const Color(0xFF00E0B2),
    'Red Bull': const Color(0xFF2b2c38),
    'Williams': const Color(0xFF0D3DAA),
  };
}
