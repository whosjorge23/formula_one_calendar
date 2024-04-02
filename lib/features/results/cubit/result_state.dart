part of 'result_cubit.dart';

@freezed
class ResultState with _$ResultState {
  const factory ResultState.initial({
    List<Race>? raceResults,
  }) = _Initial;
}
