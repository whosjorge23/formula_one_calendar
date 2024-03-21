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
}
