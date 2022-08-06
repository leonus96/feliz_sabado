import 'package:feliz_sabado/domain/usecases/get_current_theme.dart';
import 'package:feliz_sabado/presentation/providers/loader/loader.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends Loader<Brightness> {
  ThemeProvider({required GetCurrentTheme getCurrentTheme})
      : super(getCurrentTheme.execute, initialValue: Brightness.light) {
    load();
  }
}
