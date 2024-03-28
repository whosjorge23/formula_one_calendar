part of 'home_screen_shell_cubit.dart';

@freezed
class HomeScreenShellState with _$HomeScreenShellState {
  const factory HomeScreenShellState.initial({
    @Default(0) int selectedIndex,
  }) = _Initial;
}
