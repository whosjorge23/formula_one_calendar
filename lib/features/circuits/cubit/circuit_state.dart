part of 'circuit_cubit.dart';

@freezed
class CircuitState with _$CircuitState {
  const factory CircuitState.initial({
    List<Circuit>? circuitLocations,
  }) = _Initial;
}
