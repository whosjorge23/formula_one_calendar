import 'package:flutter/foundation.dart';

class ConstructorData {
  final MRDConstructorData MRData;

  ConstructorData({required this.MRData});

  factory ConstructorData.fromJson(Map<String, dynamic> json) {
    return ConstructorData(
      MRData: MRDConstructorData.fromJson(json['MRData']),
    );
  }
}

class MRDConstructorData {
  final ConstructorTable constructorTable;

  MRDConstructorData({required this.constructorTable});

  factory MRDConstructorData.fromJson(Map<String, dynamic> json) {
    return MRDConstructorData(
      constructorTable: ConstructorTable.fromJson(json['ConstructorTable']),
    );
  }
}

class ConstructorTable {
  final List<Constructors> constructors;

  ConstructorTable({required this.constructors});

  factory ConstructorTable.fromJson(Map<String, dynamic> json) {
    var list = json['Constructors'] as List<dynamic>;
    List<Constructors> constructorList =
    list.map((item) => Constructors.fromJson(item)).toList();

    return ConstructorTable(constructors: constructorList);
  }
}

class Constructors {
  final String constructorId;
  final String name;
  final String url;
  final String nationality;

  Constructors({
    required this.constructorId,
    required this.name,
    required this.url,
    required this.nationality,
  });

  factory Constructors.fromJson(Map<String, dynamic> json) {
    return Constructors(
      constructorId: json['constructorId'],
      name: json['name'],
      url: json['url'],
      nationality: json['nationality'],
    );
  }
}
