// coverage:ignore-file
import 'package:flutter/material.dart';

const Color destinyDarkNavyBlue = Color(0xFF29303C);

const Color destinyDarkGrey = Color(0xFF232C2F);

const Color destinyBlack = Color(0xFF151D20);

const Color destinyClearGrey = Color(0xFFE5E8EE);

const Color destinyYellowLight = Color(0xFFFDCD47);

const Color successColor = Color(0xFF00B74A);

const Color dangerColor = Color(0xFFF93154);

const ColorScheme appScheme = ColorScheme(
    primary: destinyDarkNavyBlue,
    secondary: destinyDarkGrey,
    tertiary: destinyYellowLight,
    background: destinyDarkGrey,
    brightness: Brightness.light,
    onError: dangerColor,
    error: dangerColor,
    onPrimary: destinyClearGrey,
    onSecondary: destinyClearGrey,
    onBackground: destinyClearGrey,
    surface: destinyDarkNavyBlue,
    onSurface: destinyClearGrey
);

class AppTheme {
  static final ThemeData defaultTheme = ThemeData(
    fontFamily: 'NeueHaasDisplay',
    scaffoldBackgroundColor: appScheme.background,
    colorScheme: appScheme,
    useMaterial3: true
  );
}
