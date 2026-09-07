import 'package:flutter/material.dart';

import 'theme_colors.dart';
import 'theme_text_style.dart';

/// {@template theme}
/// App theme data.
/// {@endtemplate}
extension type AppThemeData._(ThemeData data) implements ThemeData {
  /// {@macro theme}
  factory AppThemeData.light({String? fontFamily}) => ._(_appLightTheme(fontFamily));

  /// {@macro theme}
  factory AppThemeData.dark({String? fontFamily}) => ._(_appDarkTheme(fontFamily));
}

/// Extension on [ThemeData] to provide App theme data.
extension AutoThemeExtension on ThemeData {
  /// Returns the App theme colors.
  ThemeColors get appColors =>
      extension<ThemeColors>() ??
      switch (brightness) {
        .light => .light,
        .dark => .dark,
      };

  ThemeTextStyles get appTextStyles =>
      extension<ThemeTextStyles>() ??
      switch (brightness) {
        .light => .light,
        .dark => .dark,
      };
}
// --- Light Theme --- //

/// Light theme data for the App.
ThemeData _appLightTheme(String? fontFamily) => ThemeData(
  fontFamily: fontFamily,
  brightness: .light,
  useMaterial3: true,
  scaffoldBackgroundColor: ThemeColors.lightScaffoldBackgroundColor,
  extensions: <ThemeExtension<Object?>>{ThemeColors.light, ThemeTextStyles.light},
);

// --- Dark Theme --- //

/// Dark theme data for the App.
ThemeData _appDarkTheme(String? fontFamily) => ThemeData(
  fontFamily: fontFamily,
  brightness: .dark,
  useMaterial3: true,
  scaffoldBackgroundColor: ThemeColors.darkScaffoldBackgroundColor,
  extensions: <ThemeExtension<Object?>>{ThemeColors.dark, ThemeTextStyles.dark},
);
