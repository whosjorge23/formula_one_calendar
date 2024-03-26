import 'package:json_annotation/json_annotation.dart';

part 'driver.g.dart';

@JsonSerializable()
class DriverData {
  @JsonKey(name: "MRData")
  MrDriverData? mrData;

  DriverData({
    this.mrData,
  });

  factory DriverData.fromJson(Map<String, dynamic> json) => _$DriverDataFromJson(json);

  Map<String, dynamic> toJson() => _$DriverDataToJson(this);
}

@JsonSerializable()
class MrDriverData {
  @JsonKey(name: "DriverTable")
  DriverTable? driverTable;

  MrDriverData({
    this.driverTable,
  });

  factory MrDriverData.fromJson(Map<String, dynamic> json) => _$MrDriverDataFromJson(json);

  Map<String, dynamic> toJson() => _$MrDriverDataToJson(this);
}

@JsonSerializable()
class DriverTable {
  @JsonKey(name: "Drivers")
  List<Driver>? drivers;

  DriverTable({
    this.drivers,
  });

  factory DriverTable.fromJson(Map<String, dynamic> json) => _$DriverTableFromJson(json);

  Map<String, dynamic> toJson() => _$DriverTableToJson(this);
}

@JsonSerializable()
class Driver {
  @JsonKey(name: "driverId")
  String? driverId;
  @JsonKey(name: "permanentNumber")
  String? permanentNumber;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "givenName")
  String? givenName;
  @JsonKey(name: "familyName")
  String? familyName;
  @JsonKey(name: "dateOfBirth")
  String? dateOfBirth;
  @JsonKey(name: "nationality")
  String? nationality;

  Driver({
    this.driverId,
    this.permanentNumber,
    this.code,
    this.url,
    this.givenName,
    this.familyName,
    this.dateOfBirth,
    this.nationality,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

  Map<String, dynamic> toJson() => _$DriverToJson(this);

  String get getDriverFlag => driverFlag[nationality] ?? "";

  String get getDriverPic => driverPic[driverId] ?? "";

  String get getDriverHelmetPic => driverHelmet[driverId] ?? "";

  static Map<String, String> driverFlag = {
    'Thai': '🇹🇭',
    'Spanish': '🇪🇸',
    'British': '🇬🇧',
    'French': '🇫🇷',
    'German': '🇩🇪',
    'American': '🇺🇸',
    'Finnish': '🇫🇮',
    'Dutch': '🇳🇱',
    'Monegasque': '🇲🇨',
    'Danish': '🇩🇰',
    'Mexican': '🇲🇽',
    'Australian': '🇦🇺',
    'Canadian': '🇨🇦',
    'Japanese': '🇯🇵',
    'Chinese': '🇨🇳',
  };
  static Map<String, String> driverPic = {
    "zhou":
        "https://media.formula1.com/content/dam/fom-website/drivers/2024Drivers/zhou.jpg.img.1920.medium.jpg/1677069909295.jpg",
    "bottas":
        "https://media.formula1.com/content/dam/fom-website/drivers/2024Drivers/bottas.jpg.img.1920.medium.jpg/1677069810695.jpg",
    "tsunoda":
        "https://media.formula1.com/content/dam/fom-website/drivers/2024Drivers/tsunoda.jpg.img.1920.medium.jpg/1677069846213.jpg",
    "ricciardo":
        "https://media.formula1.com/content/dam/fom-website/drivers/2024Drivers/ricciardo.jpg.img.1024.medium.jpg/1708344126609.jpg",
    "gasly":
        "https://media.formula1.com/content/dam/fom-website/drivers/2024Drivers/gasly.jpg.img.1920.medium.jpg/1676983081984.jpg",
    "ocon":
        "https://media.formula1.com/content/dam/fom-website/drivers/2024Drivers/ocon.jpg.img.1920.medium.jpg/1677069269007.jpg",
    "stroll":
        "https://media.formula1.com/content/dam/fom-website/drivers/2024Drivers/stroll.jpg.img.1920.medium.jpg/1677069453013.jpg",
    "alonso":
        "https://media.formula1.com/content/dam/fom-website/drivers/2024Drivers/alonso.jpg.img.1920.medium.jpg/1677244577162.jpg",
    "leclerc":
        "https://media.formula1.com/content/dam/fom-website/drivers/2024Drivers/leclerc.jpg.img.1920.medium.jpg/1677069223130.jpg",
    "sainz":
        "https://media.formula1.com/content/dam/fom-website/drivers/2024Drivers/sainz.jpg.img.1920.medium.jpg/1677069189406.jpg",
    "kevin_magnussen":
        "https://media.formula1.com/content/dam/fom-website/drivers/2024Drivers/magnussen.jpg.img.1920.medium.jpg/1677069387823.jpg",
    "hulkenberg":
        "https://media.formula1.com/content/dam/fom-website/drivers/2024Drivers/hulkenberg.jpg.img.1920.medium.jpg/1676983071882.jpg",
    "norris":
        "https://media.formula1.com/content/dam/fom-website/drivers/2024Drivers/norris.jpg.img.1920.medium.jpg/1677069505471.jpg",
    "piastri":
        "https://media.formula1.com/content/dam/fom-website/drivers/2024Drivers/piastri.jpg.img.1920.medium.jpg/1676983075734.jpg",
    "hamilton":
        "https://media.formula1.com/content/dam/fom-website/drivers/2024Drivers/hamilton.jpg.img.1920.medium.jpg/1677069594164.jpg",
    "russell":
        "https://media.formula1.com/content/dam/fom-website/drivers/2024Drivers/russell.jpg.img.1920.medium.jpg/1677069334466.jpg",
    "max_verstappen":
        "https://media.formula1.com/content/dam/fom-website/drivers/2024Drivers/verstappen.jpg.img.1920.medium.jpg/1677069646195.jpg",
    "perez":
        "https://media.formula1.com/content/dam/fom-website/drivers/2024Drivers/perez.jpg.img.1920.medium.jpg/1677069773437.jpg",
    "albon":
        "https://media.formula1.com/content/dam/fom-website/drivers/2024Drivers/albon.jpg.img.1920.medium.jpg/1677068770293.jpg",
    "sargeant":
        "https://media.formula1.com/content/dam/fom-website/drivers/2024Drivers/sargeant.jpg.img.1920.medium.jpg/1676983079144.jpg",
  };
  static Map<String, String> driverHelmet = {
    "zhou": "https://media.formula1.com/content/dam/fom-website/manual/Helmets2024/zhou.png",
    "bottas": "https://media.formula1.com/content/dam/fom-website/manual/Helmets2024/bottas.png",
    "tsunoda": "https://media.formula1.com/content/dam/fom-website/manual/Helmets2024/tsunoda.png",
    "ricciardo": "https://media.formula1.com/content/dam/fom-website/manual/Helmets2024/ricciardo.png",
    "gasly": "https://media.formula1.com/content/dam/fom-website/manual/Helmets2024/gasly.png",
    "ocon": "https://media.formula1.com/content/dam/fom-website/manual/Helmets2024/ocon.png",
    "stroll": "https://media.formula1.com/content/dam/fom-website/manual/Helmets2024/stroll.png",
    "alonso": "https://media.formula1.com/content/dam/fom-website/manual/Helmets2024/alonso.png",
    "leclerc": "https://media.formula1.com/content/dam/fom-website/manual/Helmets2024/leclerc.png",
    "sainz": "https://media.formula1.com/content/dam/fom-website/manual/Helmets2024/sainz.png",
    "kevin_magnussen": "https://media.formula1.com/content/dam/fom-website/manual/Helmets2024/magnussen.png",
    "hulkenberg": "https://media.formula1.com/content/dam/fom-website/manual/Helmets2024/hulkenberg.png",
    "norris": "https://media.formula1.com/content/dam/fom-website/manual/Helmets2024/norris.png",
    "piastri": "https://media.formula1.com/content/dam/fom-website/manual/Helmets2024/piastri.png",
    "hamilton": "https://media.formula1.com/content/dam/fom-website/manual/Helmets2024/hamilton.png",
    "russell": "https://media.formula1.com/content/dam/fom-website/manual/Helmets2024/russell.png",
    "max_verstappen": "https://media.formula1.com/content/dam/fom-website/manual/Helmets2024/verstappen.png",
    "perez": "https://media.formula1.com/content/dam/fom-website/manual/Helmets2024/perez.png",
    "albon": "https://media.formula1.com/content/dam/fom-website/manual/Helmets2024/albon.png",
    "sargeant": "https://media.formula1.com/content/dam/fom-website/manual/Helmets2024/sargeant.png",
  };
}
