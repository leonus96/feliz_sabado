import 'package:flutter/material.dart';

abstract class SharedPreferencesRepository {
  Future<Brightness> getCurrentTheme();
}
