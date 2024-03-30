part of 'driver_cubit.dart';

@freezed
class DriverState with _$DriverState {
  const factory DriverState.initial({
    Driver? driver,
  }) = _Initial;
}
