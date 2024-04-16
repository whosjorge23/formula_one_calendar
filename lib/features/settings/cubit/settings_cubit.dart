import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:formula_one_calendar/shared_export.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'settings_cubit.freezed.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState.initial()) {
    loadSettings();
  }

  Future<void> loadSettings() async {
    Locale? locale = await sharedPrefsService.getLocale() ?? const Locale('en');
    ThemeMode themeMode = await sharedPrefsService.getValue("themeMode") ?? ThemeMode.system;

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    emit(state.copyWith(locale: locale, themeMode: themeMode, version: version, buildNumber: buildNumber));
  }

  void setLocale(Locale locale) async {
    await sharedPrefsService.setLocale(locale);
    emit(state.copyWith(locale: locale));
  }

  void changeMode(ThemeMode? mode) async {
    await sharedPrefsService.setValue("themeMode", mode ?? ThemeMode.system);
    emit(state.copyWith(themeMode: mode ?? ThemeMode.system));
  }
}
