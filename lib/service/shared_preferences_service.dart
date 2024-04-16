import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  Future<T?> getValue<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      if (T == String) {
        return prefs.getString(key) as T;
      }
      if (T == int) {
        return prefs.getInt(key) as T;
      }
      if (T == bool) {
        return prefs.getBool(key) as T;
      }
      if (T == ThemeMode) {
        String? themeModeString = prefs.getString(key);
        if (themeModeString != null) {
          // Convert the stored string back to a ThemeMode enum
          switch (themeModeString) {
            case 'system':
              return ThemeMode.system as T;
            case 'light':
              return ThemeMode.light as T;
            case 'dark':
              return ThemeMode.dark as T;
            default:
              return ThemeMode.system as T; // Default to system if unknown
          }
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<void> setValue<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      if (value is String) {
        await prefs.setString(key, value);
      }
      if (value is int) {
        await prefs.setInt(key, value);
      }
      if (value is bool) {
        await prefs.setBool(key, value);
      }
      if (value is ThemeMode) {
        // Convert ThemeMode to its string representation
        String themeModeString = _themeModeToString(value);
        await prefs.setString(key, themeModeString);
      }
    } catch (e) {
      return;
    }
    return;
  }

  Future<Map<String, dynamic>> getJSON(String key) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final mapJSON = prefs.getString(key);
      return Map<String, dynamic>.from(jsonDecode(mapJSON ?? '{}'));
    } catch (e) {
      return {};
    }
  }

  Future<void> saveJSON(
    String key,
    Map<String, dynamic> map,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, jsonEncode(map));
  }

  Future<void> removeValue(String key) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      await prefs.remove(key);
    } catch (e) {
      return;
    }
    return;
  }

  String _themeModeToString(ThemeMode themeMode) {
    // Convert ThemeMode to a string representation
    switch (themeMode) {
      case ThemeMode.system:
        return 'system';
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      default:
        return 'system'; // Default to system if unknown
    }
  }

  Future<void> setLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale.toString());
  }

  Future<Locale?> getLocale() async {
    final prefs = await SharedPreferences.getInstance();
    String? localeString = prefs.getString('locale');
    if (localeString != null) {
      // Locale string is expected to be in the form 'languageCode_countryCode'
      // Splitting the string to get the language code and the country code
      List<String> parts = localeString.split('_');
      // If there's no underscore, parts[0] will be the whole string
      String languageCode = parts[0];
      String? countryCode = parts.length > 1 ? parts[1] : null;

      return Locale(languageCode, countryCode);
    }
    return null;
  }
}
