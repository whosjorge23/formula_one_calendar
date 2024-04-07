part of 'driver_cubit.dart';

@freezed
class DriverState with _$DriverState {
  const factory DriverState.initial({
    Driver? driver,
    @Default(0) int driverPoints,
  }) = _Initial;
}
