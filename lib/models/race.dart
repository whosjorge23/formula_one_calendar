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

  String get getCircuitPic => circuitPic[circuitName] ?? "";

  static Map<String, String> circuitPic = {
    "Bahrain International Circuit":
        "https://media.formula1.com/image/upload/f_auto/q_auto/v1677245035/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Bahrain.png.transform/2col-retina/image.png",
    "Jeddah Corniche Circuit":
        "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Saudi%20Arabia.png.transform/2col-retina/image.png",
    "Albert Park Grand Prix Circuit":
        "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Australia.png.transform/2col-retina/image.png",
    "Baku City Circuit":
        "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Azerbaijan.png.transform/2col-retina/image.png",
    "Miami International Autodrome":
        "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Miami.png.transform/2col-retina/image.png",
    "Autodromo Enzo e Dino Ferrari":
        "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Emilia%20Romagna.png.transform/2col-retina/image.png",
    "Circuit de Monaco":
        "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Monaco.png.transform/2col-retina/image.png",
    "Circuit de Barcelona-Catalunya":
        "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Spain.png.transform/2col-retina/image.png",
    "Circuit Gilles Villeneuve":
        "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Canada.png.transform/2col-retina/image.png",
    "Red Bull Ring":
        "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Austria.png.transform/2col-retina/image.png",
    "Silverstone Circuit":
        "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Great%20Britain.png.transform/2col-retina/image.png",
    "Hungaroring":
        "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Hungary.png.transform/2col-retina/image.png",
    "Circuit de Spa-Francorchamps":
        "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Belgium.png.transform/2col-retina/image.png",
    "Circuit Park Zandvoort":
        "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Netherlands.png.transform/2col-retina/image.png",
    "Autodromo Nazionale di Monza":
        "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Italy.png.transform/2col-retina/image.png",
    "Marina Bay Street Circuit":
        "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Singapore.png.transform/2col-retina/image.png",
    "Suzuka Circuit":
        "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Japan.png.transform/2col-retina/image.png",
    "Losail International Circuit":
        "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Qatar.png.transform/2col-retina/image.png",
    "Circuit of the Americas":
        "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/United%20States.png.transform/2col-retina/image.png",
    "Autódromo Hermanos Rodríguez":
        "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Mexico.png.transform/2col-retina/image.png",
    "Autódromo José Carlos Pace":
        "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Brazil.png.transform/2col-retina/image.png",
    "Las Vegas Strip Street Circuit":
        "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Las%20Vegas.png.transform/2col-retina/image.png",
    "Yas Marina Circuit":
        "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Abu%20Dhabi.png.transform/2col-retina/image.png",
  };
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

  String get getCountryFlag => countryFlag[country] ?? "";

  static Map<String, String> countryFlag = {
    'Bahrain': '🇧🇭',
    'UK': '🇬🇧',
    'Saudi Arabia': '🇸🇦',
    'Australia': '🇦🇺',
    'Azerbaijan': '🇦🇿',
    'USA': '🇺🇸',
    'United States': '🇺🇸',
    'Italy': '🇮🇹',
    'Monaco': '🇲🇨',
    'Spain': '🇪🇸',
    'Canada': '🇨🇦',
    'Austria': '🇦🇹',
    'Hungary': '🇭🇺',
    'Belgium': '🇧🇪',
    'Netherlands': '🇳🇱',
    'Singapore': '🇸🇬',
    'Japan': '🇯🇵',
    'Qatar': '🇶🇦',
    'Mexico': '🇲🇽',
    'Brazil': '🇧🇷',
    'UAE': '🇦🇪',
  };
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
