import 'package:flutter/material.dart';

const Color bungieBlue = Color(0xFF0096BD);

const Color bungieWhite = Color(0xFFF3F3F3);

const Color bungieGrey = Color(0xFF7E8082);

const Color successColor = Color(0xFF00B74A);

const Color dangerColor = Color(0xFFF93154);

const ColorScheme appScheme = ColorScheme(
    primary: bungieBlue,
    secondary: bungieGrey,
    background: bungieWhite,
    brightness: Brightness.light,
    onError: dangerColor,
    error: dangerColor,
    onPrimary: bungieWhite,
    onSecondary: bungieWhite,
    onBackground: Colors.black,
    surface: bungieGrey,
    onSurface: bungieWhite
);

class AppTheme {
  static final ThemeData defaultTheme = ThemeData(
      fontFamily: 'NeueHaasDisplay',
      colorScheme: appScheme
  );
}
