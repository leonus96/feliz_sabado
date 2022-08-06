import 'package:feliz_sabado/domain/repositories/shared_preferences/shared_preferences_repository.dart';
import 'package:flutter/material.dart';

class GetCurrentTheme {
  final SharedPreferencesRepository repository;

  const GetCurrentTheme(this.repository);

  Future<Brightness> execute() {
    return repository.getCurrentTheme();
  }
}
