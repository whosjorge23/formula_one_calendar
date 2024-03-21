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
}
