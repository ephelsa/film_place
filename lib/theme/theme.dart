import 'package:film_place/theme/color.dart';
import 'package:flutter/material.dart';

class FilmPlaceTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: FilmPlaceColor.richBlackFoga29,
        titleTextStyle: TextStyle(
          color: FilmPlaceColor.mintCream,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: FilmPlaceColor.imperialRed,
        backgroundColor: FilmPlaceColor.richBlackFoga29,
      ),
      primaryColor: FilmPlaceColor.raisingBlack,
      scaffoldBackgroundColor: FilmPlaceColor.richBlackFoga29,
    );
  }
}
