import 'package:film_place/theme/color.dart';
import 'package:flutter/material.dart';

class FilmPlaceTypography {
  const FilmPlaceTypography._();

  static const textTheme = TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 34,
      letterSpacing: 0.5,
      color: FilmPlaceColor.mintCream,
    ),
    headline3: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 26,
      letterSpacing: 1.2,
      color: FilmPlaceColor.mintCream,
    ),
    headline6: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      letterSpacing: 0.15,
      color: FilmPlaceColor.mintCream,
    ),
    bodyText1: TextStyle(
      fontSize: 16,
      color: FilmPlaceColor.mintCream,
    ),
  );

  static const tagTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    letterSpacing: 0.25,
    color: FilmPlaceColor.mintCream,
  );
}
