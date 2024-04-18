import 'package:flutter/material.dart';
import 'package:formula_one_calendar/service/context_extension.dart';
import 'package:formula_one_calendar/shared_export.dart';
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

  String get getConstructorNationalityTranslation => constructorNationalityTranslation[nationality] ?? "";

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

  static Map<String, String> constructorNationalityTranslation = {
    'Swiss': globalContext.l10n.swiss,
    'British': globalContext.l10n.british,
    'French': globalContext.l10n.french,
    'German': globalContext.l10n.german,
    'American': globalContext.l10n.american,
    'Italian': globalContext.l10n.italian,
    'Austrian': globalContext.l10n.austrian,
  };

  static Map<String, String> constructorImage = {
    'Sauber':
        'https://media.formula1.com/content/dam/fom-website/teams/2024/kick-sauber-logo.png.transform/2col-retina/image.png',
    'RB F1 Team':
        'https://media.formula1.com/content/dam/fom-website/teams/2024/rb-logo.png.transform/2col-retina/image.png',
    'Alpine F1 Team':
        'https://media.formula1.com/content/dam/fom-website/teams/2024/alpine-logo.png.transform/2col-retina/image.png',
    'Aston Martin':
        'https://media.formula1.com/content/dam/fom-website/teams/2024/aston-martin-logo.png.transform/2col-retina/image.png',
    'Ferrari':
        'https://media.formula1.com/content/dam/fom-website/teams/2024/ferrari-logo.png.transform/2col-retina/image.png',
    'Haas F1 Team':
        'https://media.formula1.com/content/dam/fom-website/teams/2024/haas-f1-team-logo.png.transform/2col-retina/image.png',
    'McLaren':
        'https://media.formula1.com/content/dam/fom-website/teams/2024/mclaren-logo.png.transform/2col-retina/image.png',
    'Mercedes':
        'https://media.formula1.com/content/dam/fom-website/teams/2024/mercedes-logo.png.transform/2col-retina/image.png',
    'Red Bull':
        'https://media.formula1.com/content/dam/fom-website/teams/2024/red-bull-racing-logo.png.transform/2col-retina/image.png',
    'Williams':
        'https://media.formula1.com/content/dam/fom-website/teams/2024/williams-logo.png.transform/2col-retina/image.png',
  };

  static Map<String, String> constructorImageEXT = {
    'Sauber': 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/team%20logos/kick%20sauber.png',
    'RB F1 Team': 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/team%20logos/rb.jpg',
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
    'Sauber':
        'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2024/kick-sauber.png.transform/4col-retina/image.png',
    'RB F1 Team':
        'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2024/rb.png.transform/4col-retina/image.png',
    'Alpine F1 Team':
        'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2024/alpine.png.transform/4col-retina/image.png',
    'Aston Martin':
        'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2024/aston-martin.png.transform/4col-retina/image.png',
    'Ferrari':
        'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2024/ferrari.png.transform/4col-retina/image.png',
    'Haas F1 Team':
        'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2024/haas-f1-team.png.transform/4col-retina/image.png',
    'McLaren':
        'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2024/mclaren.png.transform/4col-retina/image.png',
    'Mercedes':
        'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2024/mercedes.png.transform/4col-retina/image.png',
    'Red Bull':
        'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2024/red-bull-racing.png.transform/4col-retina/image.png',
    'Williams':
        'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2024/williams.png.transform/4col-retina/image.png',
  };

  static Map<String, String> constructorPowerUnit = {
    'Sauber': 'Ferrari',
    'RB F1 Team': 'Honda RBPT',
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
    'Sauber': ['Zhou Guanyu', 'Valtteri Bottas'],
    'RB F1 Team': ['Yuki Tsunoda', 'Daniel Ricciardo'],
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
    'Sauber': ['zhou', 'bottas'],
    'RB F1 Team': ['tsunoda', 'ricciardo'],
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
    'Sauber': 'Sauber F1 Team Stake',
    'RB F1 Team': 'RB F1 Team',
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
    'Sauber': 'Hinwil, ${globalContext.l10n.switzerland}',
    'RB F1 Team': 'Faenza, ${globalContext.l10n.italy}',
    'Alpine F1 Team': 'Enstone, ${globalContext.l10n.uk}',
    'Aston Martin': 'Silverstone, ${globalContext.l10n.uk}',
    'Ferrari': 'Maranello, ${globalContext.l10n.italy}',
    'Haas F1 Team': 'Kannapolis, ${globalContext.l10n.usa}',
    'McLaren': 'Woking, ${globalContext.l10n.uk}',
    'Mercedes': 'Brackley, ${globalContext.l10n.uk}',
    'Red Bull': 'Milton Keynes, ${globalContext.l10n.uk}',
    'Williams': 'Grove, ${globalContext.l10n.uk}',
  };

  static Map<String, String> constructorEntryYear = {
    'Sauber': '1993',
    'RB F1 Team': '1985',
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
    'Sauber': appColors.greenSauber,
    'RB F1 Team': appColors.blueRB,
    'Alpine F1 Team': appColors.blueAlpine,
    'Aston Martin': appColors.greenAstonMartin,
    'Ferrari': appColors.redFerrari,
    'Haas F1 Team': appColors.greyHaas,
    'McLaren': appColors.orangeMcLaren,
    'Mercedes': appColors.aquamarineMercedes,
    'Red Bull': appColors.blueRedBull,
    'Williams': appColors.blueWilliams,
  };
}
