part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial({
    @Default(Locale('en')) locale,
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default("") String version,
    @Default("") String buildNumber,
  }) = _Initial;
}
