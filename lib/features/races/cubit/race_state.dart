part of 'race_cubit.dart';

@freezed
class RaceState with _$RaceState {
  const factory RaceState.initial({
    List<Race>? races,
  }) = _Initial;
}
