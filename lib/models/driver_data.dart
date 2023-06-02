import 'dart:convert';

DriverData driverDataFromJson(String str) => DriverData.fromJson(json.decode(str));

String driverDataToJson(DriverData data) => json.encode(data.toJson());

class DriverData {
  DriverData({
    required this.mrDriverData,
  });

  final MrDriverData mrDriverData;

  factory DriverData.fromJson(Map<String, dynamic> json) => DriverData(
    mrDriverData: MrDriverData.fromJson(json["MRData"]),
  );

  Map<String, dynamic> toJson() => {
    "MRData": mrDriverData.toJson(),
  };
}

class MrDriverData {
  MrDriverData({
    required this.driverTable,
  });

  final DriverTable driverTable;

  factory MrDriverData.fromJson(Map<String, dynamic> json) => MrDriverData(
    driverTable: DriverTable.fromJson(json["DriverTable"]),
  );

  Map<String, dynamic> toJson() => {
    "DriverTable": driverTable.toJson(),
  };
}

class DriverTable {
  DriverTable({
    required this.drivers,
  });

  final List<Driver> drivers;

  factory DriverTable.fromJson(Map<String, dynamic> json) => DriverTable(
    drivers: List<Driver>.from(json["Drivers"].map((x) => Driver.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Drivers": List<dynamic>.from(drivers.map((x) => x.toJson())),
  };
}

class Driver {
  Driver({
    required this.driverId,
    required this.permanentNumber,
    required this.code,
    required this.url,
    required this.givenName,
    required this.familyName,
    required this.dateOfBirth,
    required this.nationality,
  });

  final String driverId;
  final String permanentNumber;
  final String code;
  final String url;
  final String givenName;
  final String familyName;
  final String dateOfBirth;
  final String nationality;

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
    driverId: json["driverId"],
    permanentNumber: json["permanentNumber"],
    code: json["code"],
    url: json["url"],
    givenName: json["givenName"],
    familyName: json["familyName"],
    dateOfBirth: json["dateOfBirth"],
    nationality: json["nationality"],
  );

  Map<String, dynamic> toJson() => {
    "driverId": driverId,
    "permanentNumber": permanentNumber,
    "code": code,
    "url": url,
    "givenName": givenName,
    "familyName": familyName,
    "dateOfBirth": dateOfBirth,
    "nationality": nationality,
  };
}
