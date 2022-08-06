import 'package:feliz_sabado/data/datasources/shared_preferences/shared_preferences_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDataSource {
  Future<Brightness> getCurrentTheme() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(SharedPreferencesKey.themeIsDark) ?? false
        ? Brightness.dark
        : Brightness.light;
  }
}
