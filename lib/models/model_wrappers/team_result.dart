import 'package:formula_one_calendar/models/constructor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team_result.g.dart';

@JsonSerializable()
class TeamResult {
  Constructors? constructors;
  int? constructorsResult;

  TeamResult({
    this.constructorsResult,
    this.constructors,
  });

  factory TeamResult.fromJson(Map<String, dynamic> json) => _$TeamResultFromJson(json);

  Map<String, dynamic> toJson() => _$TeamResultToJson(this);
}
