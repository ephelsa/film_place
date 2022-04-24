import 'package:film_place/theme/color.dart';
import 'package:film_place/theme/typography.dart';
import 'package:flutter/material.dart';

class FilmPlaceTheme {
  const FilmPlaceTheme._();

  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: FilmPlaceColor.richBlackFoga29,
        titleTextStyle: TextStyle(
          color: FilmPlaceColor.mintCream,
        ),
      ),
      colorScheme: const ColorScheme(
        secondary: FilmPlaceColor.imperialRed,
        background: FilmPlaceColor.richBlackFoga29,
        onSurface: FilmPlaceColor.mintCream,
        surface: FilmPlaceColor.richBlackFoga29,
        primary: FilmPlaceColor.raisingBlack,
        onPrimary: FilmPlaceColor.raisingBlack,
        brightness: Brightness.dark,
        error: FilmPlaceColor.ultraRed,
        onBackground: FilmPlaceColor.richBlackFoga29,
        onError: FilmPlaceColor.richBlackFoga29,
        onSecondary: FilmPlaceColor.mustard,
      ),
      primaryColor: FilmPlaceColor.raisingBlack,
      scaffoldBackgroundColor: FilmPlaceColor.richBlackFoga29,
      iconTheme: const IconThemeData(
        color: FilmPlaceColor.mintCream,
      ),
      textTheme: FilmPlaceTypography.textTheme,
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: FilmPlaceColor.raisingBlack,
        actionTextColor: FilmPlaceColor.mustard,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(),
        contentTextStyle: FilmPlaceTypography.tagTextStyle,
      ),
    );
  }
}
