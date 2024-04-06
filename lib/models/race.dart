import 'package:intl/intl.dart';
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

  String get getTimeGMT => formatTimeInGMT(time) ?? "";

  String get getDateFormatted => formatDate(date) ?? "";

  String formatTimeInGMT(String? timeString) {
    final utcFormat = DateFormat("HH:mm:ss'Z'", 'en_US');
    try {
      final utcDate = utcFormat.parseUtc(timeString ?? "");
      final localDate = utcDate.toLocal();
      final localFormat = DateFormat('HH:mm');
      return localFormat.format(localDate);
    } catch (e) {
      return '🤷‍♂️🤷‍♂️';
    }
  }

  String formatDate(String? dateString) {
    try {
      final date = DateTime.parse(dateString ?? "");
      final formatter = DateFormat('MM/dd/yyyy');
      return formatter.format(date);
    } catch (e) {
      return '🤷‍♂️🤷‍♂️';
    }
  }
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

  String get getCircuitDRSPic => circuitDRSPic[circuitName] ?? "";

  String get getCircuitFirstGrandPrix => circuitFirstGrandPrix[circuitName] ?? "";

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
    "Shanghai International Circuit":
        "https://media.formula1.com/image/upload/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/China.png.transform/2col-retina/image.png",
  };
  static Map<String, String> circuitDRSPic = {
    "Bahrain International Circuit":
        "https://media.formula1.com/image/upload/f_auto/q_auto/v1677244985/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Bahrain_Circuit.png.transform/8col-retina/image.png",
    "Jeddah Corniche Circuit":
        "https://media.formula1.com/image/upload/f_auto/q_auto/v1677244985/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Saudi_Arabia_Circuit.png.transform/8col-retina/image.png",
    "Albert Park Grand Prix Circuit":
        "https://media.formula1.com/image/upload/f_auto/q_auto/v1677244985/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Australia_Circuit.png.transform/8col-retina/image.png",
    "Baku City Circuit":
        "https://media.formula1.com/image/upload/f_auto/q_auto/v1677244987/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Baku_Circuit.png.transform/8col-retina/image.png",
    "Miami International Autodrome":
        "https://media.formula1.com/image/upload/f_auto/q_auto/v1677244985/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Miami_Circuit.png.transform/8col-retina/image.png",
    "Autodromo Enzo e Dino Ferrari":
        "https://media.formula1.com/image/upload/f_auto/q_auto/v1677244984/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Emilia_Romagna_Circuit.png.transform/8col-retina/image.png",
    "Circuit de Monaco":
        "https://media.formula1.com/image/upload/f_auto/q_auto/v1677244984/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Monoco_Circuit.png.transform/8col-retina/image.png",
    "Circuit de Barcelona-Catalunya":
        "https://media.formula1.com/image/upload/f_auto/q_auto/v1677244986/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Spain_Circuit.png.transform/8col-retina/image.png",
    "Circuit Gilles Villeneuve":
        "https://media.formula1.com/image/upload/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Canada_Circuit.png.transform/8col-retina/image.png",
    "Red Bull Ring":
        "https://media.formula1.com/image/upload/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Austria_Circuit.png.transform/8col-retina/image.png",
    "Silverstone Circuit":
        "https://media.formula1.com/image/upload/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Great_Britain_Circuit.png.transform/8col-retina/image.png",
    "Hungaroring":
        "https://media.formula1.com/image/upload/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Hungary_Circuit.png.transform/8col-retina/image.png",
    "Circuit de Spa-Francorchamps":
        "https://media.formula1.com/image/upload/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Belgium_Circuit.png.transform/8col-retina/image.png",
    "Circuit Park Zandvoort":
        "https://media.formula1.com/image/upload/f_auto/q_auto/v1677244984/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Netherlands_Circuit.png.transform/8col-retina/image.png",
    "Autodromo Nazionale di Monza":
        "https://media.formula1.com/image/upload/f_auto/q_auto/v1677244987/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Italy_Circuit.png.transform/8col-retina/image.png",
    "Marina Bay Street Circuit":
        "https://media.formula1.com/image/upload/f_auto/q_auto/v1683633963/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Singapore_Circuit.png.transform/8col-retina/image.png",
    "Suzuka Circuit":
        "https://media.formula1.com/image/upload/f_auto/q_auto/v1677250050/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Japan_Circuit.png.transform/8col-retina/image.png",
    "Losail International Circuit":
        "https://media.formula1.com/image/upload/f_auto/q_auto/v1677244985/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Qatar_Circuit.png.transform/8col-retina/image.png",
    "Circuit of the Americas":
        "https://media.formula1.com/image/upload/f_auto/q_auto/v1677244984/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/USA_Circuit.png.transform/8col-retina/image.png",
    "Autódromo Hermanos Rodríguez":
        "https://media.formula1.com/image/upload/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Mexico_Circuit.png.transform/8col-retina/image.png",
    "Autódromo José Carlos Pace":
        "https://media.formula1.com/image/upload/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Brazil_Circuit.png.transform/8col-retina/image.png",
    "Las Vegas Strip Street Circuit":
        "https://media.formula1.com/image/upload/f_auto/q_auto/v1677249930/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Las_Vegas_Circuit.png.transform/8col-retina/image.png",
    "Yas Marina Circuit":
        "https://media.formula1.com/image/upload/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Abu_Dhabi_Circuit.png.transform/8col-retina/image.png",
    "Shanghai International Circuit":
        "https://media.formula1.com/image/upload/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/China_Circuit.png.transform/8col-retina/image.png",
  };
  static Map<String, String> circuitFirstGrandPrix = {
    "Bahrain International Circuit": "2004",
    "Jeddah Corniche Circuit": "2021",
    "Albert Park Grand Prix Circuit": "1996",
    "Baku City Circuit": "2016",
    "Miami International Autodrome": "2022",
    "Autodromo Enzo e Dino Ferrari": "1980",
    "Circuit de Monaco": "1950",
    "Circuit de Barcelona-Catalunya": "1991",
    "Circuit Gilles Villeneuve": "1978",
    "Red Bull Ring": "1970",
    "Silverstone Circuit": "1950",
    "Hungaroring": "1986",
    "Circuit de Spa-Francorchamps": "1950",
    "Circuit Park Zandvoort": "1952",
    "Autodromo Nazionale di Monza": "1950",
    "Marina Bay Street Circuit": "2008",
    "Suzuka Circuit": "1987",
    "Losail International Circuit": "2021",
    "Circuit of the Americas": "2012",
    "Autódromo Hermanos Rodríguez": "1963",
    "Autódromo José Carlos Pace": "1973",
    "Las Vegas Strip Street Circuit": "2023",
    "Yas Marina Circuit": "2009",
    "Shanghai International Circuit": "2004",
  };
  static Map<String, String> circuitNumberLaps = {
    "Bahrain International Circuit": "57",
    "Jeddah Corniche Circuit": "50",
    "Albert Park Grand Prix Circuit": "58",
    "Baku City Circuit": "51",
    "Miami International Autodrome": "57",
    "Autodromo Enzo e Dino Ferrari": "63",
    "Circuit de Monaco": "78",
    "Circuit de Barcelona-Catalunya": "66",
    "Circuit Gilles Villeneuve": "70",
    "Red Bull Ring": "71",
    "Silverstone Circuit": "52",
    "Hungaroring": "70",
    "Circuit de Spa-Francorchamps": "44",
    "Circuit Park Zandvoort": "72",
    "Autodromo Nazionale di Monza": "53",
    "Marina Bay Street Circuit": "62",
    "Suzuka Circuit": "53",
    "Losail International Circuit": "57",
    "Circuit of the Americas": "56",
    "Autódromo Hermanos Rodríguez": "71",
    "Autódromo José Carlos Pace": "71",
    "Las Vegas Strip Street Circuit": "50",
    "Yas Marina Circuit": "58",
    "Shanghai International Circuit": "56",
  };
  static Map<String, String> circuitLength = {
    "Bahrain International Circuit": "5.412km",
    "Jeddah Corniche Circuit": "6.174km",
    "Albert Park Grand Prix Circuit": "5.278km",
    "Baku City Circuit": "6.003km",
    "Miami International Autodrome": "5.412km",
    "Autodromo Enzo e Dino Ferrari": "4.909km",
    "Circuit de Monaco": "3.337km",
    "Circuit de Barcelona-Catalunya": "4.657km",
    "Circuit Gilles Villeneuve": "4.361km",
    "Red Bull Ring": "4.318km",
    "Silverstone Circuit": "5.891km",
    "Hungaroring": "4.381km",
    "Circuit de Spa-Francorchamps": "7.004km",
    "Circuit Park Zandvoort": "4.259km",
    "Autodromo Nazionale di Monza": "5.793km",
    "Marina Bay Street Circuit": "4.94km",
    "Suzuka Circuit": "5.807km",
    "Losail International Circuit": "5.419km",
    "Circuit of the Americas": "5.513km",
    "Autódromo Hermanos Rodríguez": "4.304km",
    "Autódromo José Carlos Pace": "4.309km",
    "Las Vegas Strip Street Circuit": "6.201km",
    "Yas Marina Circuit": "5.281km",
    "Shanghai International Circuit": "5.451km",
  };
  static Map<String, String> circuitRaceDistance = {
    "Bahrain International Circuit": "308.238 km",
    "Jeddah Corniche Circuit": "308.45 km",
    "Albert Park Grand Prix Circuit": "306.124 km",
    "Baku City Circuit": "306.049 km",
    "Miami International Autodrome": "308.326 km",
    "Autodromo Enzo e Dino Ferrari": "309.049 km",
    "Circuit de Monaco": "260.286 km",
    "Circuit de Barcelona-Catalunya": "307.236 km",
    "Circuit Gilles Villeneuve": "305.27 km",
    "Red Bull Ring": "306.452 km",
    "Silverstone Circuit": "306.198 km",
    "Hungaroring": "306.63 km",
    "Circuit de Spa-Francorchamps": "308.052 km",
    "Circuit Park Zandvoort": "306.587 km",
    "Autodromo Nazionale di Monza": "306.72 km",
    "Marina Bay Street Circuit": "306.143 km",
    "Suzuka Circuit": "307.471 km",
    "Losail International Circuit": "308.611 km",
    "Circuit of the Americas": "308.405 km",
    "Autódromo Hermanos Rodríguez": "305.354 km",
    "Autódromo José Carlos Pace": "305.879 km",
    "Las Vegas Strip Street Circuit": "309.958 km",
    "Yas Marina Circuit": "306.183 km",
    "Shanghai International Circuit": "305.066 km",
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
    'China': '🇨🇳',
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
