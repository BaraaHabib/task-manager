import 'package:flutter/material.dart';
import 'package:task_master/app/theme/base/base_theme.dart';

final class DarkTheme extends BaseTheme {

  DarkTheme();
  @override
  Brightness get brightness => Brightness.dark;

  @override
  ColorScheme get colorScheme => _colorScheme;


  ColorScheme get _colorScheme {
    return ColorScheme(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: Colors.white,
      // Background color
      background: Colors.white,
      error: Colors.red,
      // Assume red for errors
      onPrimary: Colors.white,
      // Text/icon color on primary
      onSecondary: Colors.black,
      // Text/icon color on secondary
      onSurface: Colors.black,
      // Text/icon color on surface
      onBackground: Colors.black,
      // Text/icon color on background
      onError: Colors.white,
      // Text/icon color on error
      brightness: Brightness.light,
    );
  }

  @override
  Color get primaryColor => const Color(0xFF1E88E5);

  @override
  Color get secondaryColor => const Color(0xFFEEEEEE);

  @override
  ProgressIndicatorThemeData get progressIndicatorThemeData =>
      const ProgressIndicatorThemeData(
        color: Colors.black,
      );
}
