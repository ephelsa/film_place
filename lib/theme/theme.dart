import 'package:flutter/material.dart';

class FilmPlaceTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 0, 0, 0)),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: const Color(0xFF13B9FF),
      ),
    );
  }
}
