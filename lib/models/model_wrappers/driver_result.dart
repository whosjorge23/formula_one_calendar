import 'package:formula_one_calendar/models/constructor.dart';
import 'package:formula_one_calendar/models/driver.dart';
import 'package:json_annotation/json_annotation.dart';

part 'driver_result.g.dart';

@JsonSerializable()
class DriverResult {
  Driver? driver;
  Constructors? constructor;
  int? driverResult;

  DriverResult({
    this.driverResult,
    this.constructor,
    this.driver,
  });

  factory DriverResult.fromJson(Map<String, dynamic> json) => _$DriverResultFromJson(json);

  Map<String, dynamic> toJson() => _$DriverResultToJson(this);
}
