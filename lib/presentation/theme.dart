import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color(0xFFFFC100);

class AppTheme {
  static buildTheme(BuildContext context, Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        return Theme.of(context).copyWith(
          brightness: Brightness.dark,
          primaryColor: kPrimaryColor,
          appBarTheme: Theme.of(context).appBarTheme.copyWith(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
          textTheme: GoogleFonts.ralewayTextTheme(),
        );
      case Brightness.light:
        return Theme.of(context).copyWith(
          brightness: Brightness.light,
          primaryColor: kPrimaryColor,
          appBarTheme: Theme.of(context).appBarTheme.copyWith(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
          textTheme: GoogleFonts.ralewayTextTheme(),
        );
    }
  }

  static double paddingPx = 8.0;

  static double paddingPxX2 = 16.0;

  static SizedBox separatorH() => const SizedBox(width: 8);

  static SizedBox separatorHX2() => const SizedBox(width: 16);

  static SizedBox separatorV() => const SizedBox(height: 8);

  static SizedBox separatorVX2() => const SizedBox(height: 16);

  static bool isLight(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.light;
  }
}